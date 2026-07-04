# Hướng dẫn nâng tỷ lệ đậu CV (nội dung + trình bày)

Tài liệu này tổng hợp nghiên cứu về cách CV được sàng lọc năm 2026 (ATS + recruiter),
những thay đổi đã áp dụng vào `outputs/cv-fullstack.tex`, và checklist trước mỗi lần nộp.

## 1. CV bị loại ở đâu?

Một CV phải vượt qua **2 vòng sàng lọc** trước khi tới tay người phỏng vấn:

1. **ATS (Applicant Tracking System)** — phần mềm parse CV thành dữ liệu có cấu trúc rồi
   xếp hạng theo độ khớp từ khóa với JD. Khoảng **75% CV bị loại ở vòng này**, chủ yếu vì
   thiếu từ khóa hoặc format máy không đọc được (bảng, cột phức tạp, chữ trong ảnh/icon).
2. **Recruiter scan ~6–7 giây** — người thật lướt qua để quyết định đọc tiếp hay bỏ.
   Họ nhìn: chức danh, công ty, stack chính, và các con số nổi bật. Thông tin mạnh nhất
   phải nằm ở nửa trên trang.

## 2. Nguyên tắc nội dung

- **Từ khóa khớp JD (quan trọng nhất):** trước mỗi lần nộp, đối chiếu JD và đưa đúng
  thuật ngữ họ dùng vào Summary + Skills + bullet. Viết cả dạng đầy đủ lẫn viết tắt
  ("Domain-Driven Design (DDD)", "Amazon Web Services (AWS)") vì ATS có thể chỉ match một dạng.
  Không nhồi nhét — ATS đời mới phát hiện keyword stuffing.
- **Công thức bullet XYZ:** *Đạt được X, đo bằng Y, bằng cách Z*. Mỗi bullet 1 ý, dẫn đầu
  bằng động từ mạnh (Built, Designed, Cut, Optimized, Led) và **đưa con số lên đầu câu**
  khi có thể ("Cut build time by 80% by..." thay vì để 80% ở cuối).
- **Định lượng mọi thứ có thể:** 10M+ users, 80% build time, 90% coverage, Top 30/1.500+,
  GPA 3.7/4.0 — con số là thứ recruiter dừng mắt lại trong 6 giây.
- **Không tự dán nhãn thấp:** bỏ "Fresher/Junior" trong chức danh — ngày tháng đã nói lên
  thâm niên; nhãn tự hạ cấp chỉ làm giảm điểm khi so sánh ứng viên.
- **Không viết mô tả chung chung:** "Responsible for developing APIs" là mẫu câu bị loại;
  luôn nói API gì, tải bao nhiêu, giải quyết vấn đề gì.
- **Tuyệt đối không bịa số liệu** — mọi con số phải bảo vệ được khi bị hỏi sâu trong phỏng vấn.

## 3. Nguyên tắc trình bày

- **1 trang** cho dưới ~5 năm kinh nghiệm. **1 cột, heading chuẩn** (Summary, Experience,
  Education, Skills...) — đây là format an toàn nhất với ATS.
- **Không icon/ảnh/skill bar/bảng** — ATS không đọc được chữ trong đồ họa.
- PDF sinh từ LaTeX là **text-based PDF** (copy được chữ) nên ATS đọc tốt; một số hệ thống
  cũ thích `.docx` hơn — nếu JD yêu cầu docx thì dùng bản `outputs/cv-fullstack.docx`.
- **Font đơn giản, cỡ 10–11pt**, khoảng trắng đủ thở, ngày tháng canh phải thống nhất.
- **Đặt tên file khi nộp:** `TranVanCon-Backend-Developer-CV.pdf` (không phải `cv-fullstack.pdf`) —
  recruiter tìm lại file theo tên.
- Metadata PDF (title/author/keywords) đã được set trong `\hypersetup` — một số ATS đọc cả phần này.

## 4. Những gì đã thay đổi trong CV

| Hạng mục | Trước | Sau | Lý do |
|---|---|---|---|
| Chức danh | "Backend – Junior", "Backend – Fresher" | "Backend Developer" | Không tự hạ cấp; ngày tháng đã thể hiện level |
| Summary | Liệt kê kỹ năng | Dẫn bằng 3 con số: 10M+ users, 80% build time, 90% coverage | Recruiter thấy impact trong 6 giây đầu |
| Bullet Nexon | 2 bullet dồn nhiều ý | 3 bullet, mỗi bullet 1 ý, metric lên đầu câu | Công thức XYZ, dễ scan |
| Bullet DXDLabs | 2 bullet dồn ý | 3 bullet tách bạch: payment/signing, Redis+BullMQ, CI/CD+90% coverage | Mỗi thành tích được nhìn thấy riêng |
| Skills | 8 dòng, có dòng "Tools" yếu, liệt kê 4 pattern GoF | 7 dòng: gộp Tools vào Cloud & DevOps, thêm "RESTful API design", "unit testing" | Gọn hơn, thêm từ khóa ATS hay gặp trong JD backend |
| Stockie | Demo link nằm trong bullet | Demo link lên header cạnh "Tech Lead" | Link nổi bật hơn, bullet gọn hơn |
| PDF metadata | title/author | + subject/keywords | Hỗ trợ ATS/search |
| Spacing | — | Siết nhẹ margin + khoảng cách section/bullet | Giữ đúng 1 trang sau khi thêm nội dung |

## 5. Checklist trước MỖI lần nộp

- [ ] Đọc JD, gạch chân 8–12 từ khóa (ngôn ngữ, framework, DB, cloud, phương pháp).
- [ ] Đảm bảo các từ khóa đó xuất hiện tự nhiên trong Summary/Skills/bullet (đúng chính tả như JD).
- [ ] Đổi dòng chức danh dưới tên nếu JD dùng tên khác (VD "Node.js Developer", "Software Engineer, Backend").
- [ ] Xuất PDF, kiểm tra: đúng 1 trang, copy-paste được toàn bộ chữ, link còn click được.
- [ ] Đổi tên file: `TranVanCon-<ViTri>-CV.pdf`.
- [ ] Nếu form ứng tuyển yêu cầu docx → dùng bản docx.
- [ ] Chuẩn bị trả lời sâu cho từng con số trên CV (80% đo thế nào, 90% coverage của module nào...).

## 6. Build (NixOS)

```bash
cd cv-fullstack
nix-shell            # cài pdflatex, pdftoppm, pandoc (xem shell.nix)
./convert.sh outputs/cv-fullstack.tex   # PDF + PNG + DOCX
```

## Nguồn tham khảo

- [ATS Resume Best Practices 2026 — Resume Optimizer Pro](https://resumeoptimizerpro.com/blog/ats-friendly-resume-tips)
- [ATS-Friendly Resume Format for IT Engineers in 2026 — SoundCV](https://www.soundcv.com/blog/ats-friendly-resume-format-for-it-engineers-2026)
- [How to Optimize Your Resume for ATS in 2026 — Scale.jobs](https://scale.jobs/blog/optimize-resume-for-ats-2026-guide)
- [Anatomy of an ATS-Friendly Resume — Jobscan](https://www.jobscan.co/blog/20-ats-friendly-resume-templates/)
- [What Recruiters Look for in a Junior Dev Resume — ResumeAdapter](https://www.resumeadapter.com/blog/what-recruiters-look-for-in-junior-dev-resume)
- [Backend Developer Resume Examples — Resume Worded](https://resumeworded.com/backend-developer-resume-example)
