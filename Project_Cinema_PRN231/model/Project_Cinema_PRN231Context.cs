using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Project_Cinema_PRN231.model
{
    public partial class Project_Cinema_PRN231Context : DbContext
    {
        public Project_Cinema_PRN231Context()
        {
        }

        public Project_Cinema_PRN231Context(DbContextOptions<Project_Cinema_PRN231Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Building> Buildings { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<FilmCalender> FilmCalenders { get; set; } = null!;
        public virtual DbSet<LibraryFilm> LibraryFilms { get; set; } = null!;
        public virtual DbSet<Lot> Lots { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Room> Rooms { get; set; } = null!;
        public virtual DbSet<SeatBooking> SeatBookings { get; set; } = null!;
        public virtual DbSet<SysUser> SysUsers { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost;Database=Project_Cinema_PRN231;Trusted_Connection=SSPI;Encrypt=false;TrustServerCertificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Building>(entity =>
            {
                entity.ToTable("Building");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .HasColumnName("address");

                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .HasColumnName("code");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.HasIndex(e => e.Code, "UQ__Category__357D4CF921400D5F")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .HasColumnName("code");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.Image).HasColumnName("image");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .HasColumnName("name");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");
            });

            modelBuilder.Entity<FilmCalender>(entity =>
            {
                entity.ToTable("Film_Calender");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.EndTime).HasColumnName("end_time");

                entity.Property(e => e.FilmId).HasColumnName("film_id");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("price");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.StartTime).HasColumnName("start_time");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.HasOne(d => d.Film)
                    .WithMany(p => p.FilmCalenders)
                    .HasForeignKey(d => d.FilmId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Film_Cale__film___59063A47");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.FilmCalenders)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Film_Cale__room___59FA5E80");
            });

            modelBuilder.Entity<LibraryFilm>(entity =>
            {
                entity.ToTable("Library_Film");

                entity.HasIndex(e => e.Code, "UQ__Library___357D4CF956ED2BD0")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .HasColumnName("code");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.Director)
                    .HasMaxLength(50)
                    .HasColumnName("director");

                entity.Property(e => e.Image).HasColumnName("image");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .HasColumnName("name");

                entity.Property(e => e.ReleaseYear)
                    .HasColumnType("datetime")
                    .HasColumnName("release_year");

                entity.Property(e => e.TrailerUrl)
                    .HasColumnType("text")
                    .HasColumnName("trailer_url");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.LibraryFilms)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Library_F__categ__5AEE82B9");
            });

            modelBuilder.Entity<Lot>(entity =>
            {
                entity.ToTable("Lot");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BuildingId).HasColumnName("building_id");

                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .HasColumnName("code");

                entity.Property(e => e.Column).HasColumnName("column");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.Row).HasColumnName("row");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.Lots)
                    .HasForeignKey(d => d.BuildingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Lot__building_id__5BE2A6F2");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Lots)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Lot__room_id__5CD6CB2B");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("OrderDetail");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BarCode)
                    .HasMaxLength(20)
                    .HasColumnName("bar_code");

                entity.Property(e => e.BuildingId).HasColumnName("building_id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.FilmCalenderId).HasColumnName("film_calender_id");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.LotId).HasColumnName("lot_id");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("price");

                entity.Property(e => e.RoomId).HasColumnName("room_id");

                entity.Property(e => e.SeatBookingId).HasColumnName("seatBookingId");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.FilmCalender)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.FilmCalenderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__film___5DCAEF64");

                entity.HasOne(d => d.Lot)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.LotId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__lot_i__5EBF139D");

                entity.HasOne(d => d.SeatBooking)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.SeatBookingId)
                    .HasConstraintName("FK__OrderDeta__seatB__01142BA1");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__user___5FB337D6");
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.ToTable("Room");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BuildingId).HasColumnName("building_id");

                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .HasColumnName("code");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.HasOne(d => d.Building)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.BuildingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Room__building_i__60A75C0F");
            });

            modelBuilder.Entity<SeatBooking>(entity =>
            {
                entity.ToTable("SeatBooking");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BookingTime)
                    .HasColumnType("datetime")
                    .HasColumnName("bookingTime");

                entity.Property(e => e.FilmCalendarId).HasColumnName("film_calendar_id");

                entity.Property(e => e.LotId).HasColumnName("lot_id");

                entity.Property(e => e.Status)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("status");

                entity.HasOne(d => d.FilmCalendar)
                    .WithMany(p => p.SeatBookings)
                    .HasForeignKey(d => d.FilmCalendarId)
                    .HasConstraintName("FK__SeatBooki__film___619B8048");

                entity.HasOne(d => d.Lot)
                    .WithMany(p => p.SeatBookings)
                    .HasForeignKey(d => d.LotId)
                    .HasConstraintName("FK__SeatBooki__lot_i__628FA481");
            });

            modelBuilder.Entity<SysUser>(entity =>
            {
                entity.ToTable("Sys_User");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("created_at")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CreatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("created_by");

                entity.Property(e => e.FullName)
                    .HasMaxLength(100)
                    .HasColumnName("full_name");

                entity.Property(e => e.IsAdmin).HasColumnName("is_admin");

                entity.Property(e => e.IsDeleted).HasColumnName("is_deleted");

                entity.Property(e => e.PassWord)
                    .HasMaxLength(100)
                    .HasColumnName("pass_word");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(15)
                    .HasColumnName("phone_number");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasColumnName("updated_at");

                entity.Property(e => e.UpdatedBy)
                    .HasMaxLength(50)
                    .HasColumnName("updated_by");

                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .HasColumnName("user_name");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
