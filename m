Return-Path: <linux-mips+bounces-5300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A596A52B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88953B2558A
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A9418EFF8;
	Tue,  3 Sep 2024 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ENWVfqdh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n5RuJ26W"
X-Original-To: linux-mips@vger.kernel.org
Received: from pfhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D9918EFC8;
	Tue,  3 Sep 2024 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383700; cv=none; b=oDNSGDZTyHiceoVHYLQebc69ZjA24e5n/jR4GMNyBx3u862A9JHHWf4SkF1KU0TOij5e6fEp6emmf/MVEuNYgKR6pO+2zwx8B9jG2r0sQIo3lkhwHsZ6ceATOCbILw+FMX7uktUutyqxeGuRxqNkN4EF0zRRFGY6S+MJijwnyJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383700; c=relaxed/simple;
	bh=MR0QUePB8OZ1VODonfrqqwGNaA0pJ9XHlCOwwVcwVbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NaqkXR4O1D7918QEOYaxwxRyKwumkppaUsF7MGaqli4pcsrp6uJL+NnBr/9PbK/lvLA4slteIO6zdRPyJEM8Cl6dmih6bw9HNTuQGmZ6GPTji/0TAgXg9lojjh6YpNW70wm/oxG0ICjcgbCEDAJsBNciY3ZXYi8ofKSpRys1kRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ENWVfqdh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n5RuJ26W; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5B5741140386;
	Tue,  3 Sep 2024 13:14:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 03 Sep 2024 13:14:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725383697;
	 x=1725470097; bh=GaNfLFB6/4i23a17e2/18ZaAcRG0PU148d7jkLs6on8=; b=
	ENWVfqdhswzFfJ0Riyd/SoKDjHaJVVN+1M20NyyK028ZsUTWD6+mynQFpC5OdzEV
	r63YtduuzZcIddkwmWdpviKtIvkB/ffH6yYFNwUhjFwReqjwgT+8TPb5B2x/58QY
	kqWtE+4rSDlRKI2UED/MzLMfouWjvYCejqU3asiWPq4yNywRyNzsI4PBiOFlpeNw
	gnfGZhYY+AtKBYw+QZJL6lLvwSs5SBLbG5VHmfdfoIE8mMcrlVnnxoEHxcYZfuza
	vyV5+k6RjFNLQVq8MhbVlraW69DHrF9/pGx5uNRwBc0tW2snPR/N1UqF1p9+22Z9
	IfPxS/tulN4LyLtW6RTwvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725383697; x=
	1725470097; bh=GaNfLFB6/4i23a17e2/18ZaAcRG0PU148d7jkLs6on8=; b=n
	5RuJ26W3y2ljmUy6Kj+9cDtJ6jntB9XvUhoUeGEYWgCCRwijtXDzbDKCY9EFOpNM
	XTJNhIibnJrDVgKFC4duaZYBMWQVkme3EqL/DeHgT3zhcbpDXuS9aUN3GkmQhWMn
	YsKEATM5ABRaSDmU2aRLe4T5XYxhiVcmfugFNuPgB71ZZPIcZ7U6syubRthQqjh5
	8CKOmy/f9o1LVCiuxeJwuYrXSd2RUfTqE5QWV7lvbysy/PZk4I3ezt0ug720laBD
	GamwcPHgDkR6R5IS9PqhO5dzy+Ixesygjk9ygfwWSBvkS/aaHl6COBWNbOnpomGE
	tiD4v4A+1i8JWJGax89+g==
X-ME-Sender: <xms:EUTXZhl_YidcM-YiU3J7F-xJc4fubo_hK_njVod-UNlDE99QHUqwew>
    <xme:EUTXZs2vImQXDvGefItWaUpRgkUzgQ3We_PYNIK1bkiMZzDQ_Sm6i429l4MxyKy3V
    vweV7PLMfBGEFNZIs0>
X-ME-Received: <xmr:EUTXZnpgE5v96wwtL8tjGD1EGq8b61i5xBmBgBwn6-0XG6pS0rHLS386019Xn9IZrgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredt
    jeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedtkeeiueegtdffteeuffejledv
    keekffegudelgedufeektdeghffhhfeigeeigfenucffohhmrghinhepghhnuhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeegtddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhho
    thhonhdrmhgvpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvg
    hnrdguvgdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhluhhtihhonhhsrdhn
    vghtpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprhhitghhrghruges
    nhhougdrrghtpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtg
    hpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthht
    ohepnhgrthhhrghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EUTXZhkcSXGUwJHpJpoOla5OP3aA2m2EJPNzhrPdBgJ4GJRL-5CGNA>
    <xmx:EUTXZv0wr7wFJg4zWzesKTzwq-oO0G_abGUWjpjubyxByy9_tWRkqw>
    <xmx:EUTXZgvGvczFcbpCEL1kbqPDQKTCQ69O39X_D0xwxi0KkPETGGbeGA>
    <xmx:EUTXZjXGfDvu6vjOXQojUTMNypomOaohrKdKE2I_k1LJLpTBOtH8ag>
    <xmx:EUTXZgoq4A9wcW5wmMoz8KsbmVn-cME6HlQZawY2hGJbQkjbDBfoE_8M>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 13:14:53 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 03 Sep 2024 18:14:34 +0100
Subject: [PATCH 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config
 option
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-mips-rust-v1-1-0fdf0b2fd58f@flygoat.com>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,  Richard Weinberger <richard@nod.at>,
  Anton Ivanov <anton.ivanov@cambridgegreys.com>,
  Johannes Berg <johannes@sipsolutions.net>,
  Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,  Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
  =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@samsung.com>,
  Alice Ryhl <aliceryhl@google.com>,
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
  Steven Rostedt <rostedt@goodmis.org>,
  Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,  Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>,  Yanteng Si <siyanteng@loongson.cn>,
  Nick Desaulniers <ndesaulniers@google.com>,
  Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-um@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4568;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=MR0QUePB8OZ1VODonfrqqwGNaA0pJ9XHlCOwwVcwVbA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTrLmws/AZvTVOTty7y77KvuPfXsePt2XnsPWa3t0dx8
 3d/bNHpKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgImkSDP84S6+efXswwsSHcLX
 NoZ/1jBZsrZn9vnV/8/HpAXNUONd6s3IME1D3M2xqtK/Vfb0ip/zjTR4Z4pKK6isenArzuLGZ50
 qJgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

scripts/generate_rust_target.rs is used by several architectures
to generate target.json target spec file.

However the enablement of this feature was controlled by target
specific Makefile pieces spreading everywhere.

Introduce HAVE_GENERATE_RUST_TARGET config option as a centralized
switch to control the per-arch usage of generate_rust_target.rs.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 Makefile             | 4 ++++
 arch/Kconfig         | 8 ++++++++
 arch/um/Kconfig      | 1 +
 arch/x86/Makefile    | 1 -
 arch/x86/Makefile.um | 1 -
 rust/Makefile        | 2 +-
 scripts/Makefile     | 4 +---
 7 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2c1db7a6f793..1310e7910fc4 100644
--- a/Makefile
+++ b/Makefile
@@ -560,6 +560,7 @@ KBUILD_RUSTFLAGS := $(rust_common_flags) \
 		    -Zfunction-sections=n \
 		    -Wclippy::float_arithmetic
 
+
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
 KBUILD_RUSTFLAGS_KERNEL :=
@@ -807,6 +808,9 @@ KBUILD_CFLAGS += -Os
 KBUILD_RUSTFLAGS += -Copt-level=s
 endif
 
+ifdef CONFIG_HAVE_GENERATE_RUST_TARGET
+KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
+endif
 # Always set `debug-assertions` and `overflow-checks` because their default
 # depends on `opt-level` and `debug-assertions`, respectively.
 KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
diff --git a/arch/Kconfig b/arch/Kconfig
index 4e2eaba9e305..eb3ff6cf8501 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -377,6 +377,14 @@ config HAVE_RUST
 	  This symbol should be selected by an architecture if it
 	  supports Rust.
 
+config HAVE_GENERATE_RUST_TARGET
+	bool
+	depends on HAVE_RUST
+	help
+	  This symbol should be selected by an architecture if it
+	  supports generating Rust target files with
+	  scripts/generate_rust_target.rs.
+
 config HAVE_FUNCTION_ARG_ACCESS_API
 	bool
 	help
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index dca84fd6d00a..414e5b01d575 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -32,6 +32,7 @@ config UML
 	select TTY # Needed for line.c
 	select HAVE_ARCH_VMAP_STACK
 	select HAVE_RUST
+	select HAVE_GENERATE_RUST_TARGET if X86_32 || X86_64
 	select ARCH_HAS_UBSAN
 
 config MMU
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index a1883a30a5d8..cbd707f88a63 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -75,7 +75,6 @@ export BITS
 #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
 #
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
-KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
 #
diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index a46b1397ad01..2106a2bd152b 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -9,7 +9,6 @@ core-y += arch/x86/crypto/
 #
 ifeq ($(CONFIG_CC_IS_CLANG),y)
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
-KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 99204e33f1dd..fe3640b98011 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -378,7 +378,7 @@ $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--re
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
 	+$(call if_changed_rule,rustc_library)
-ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
+ifdef CONFIG_HAVE_GENERATE_RUST_TARGET
 $(obj)/core.o: scripts/target.json
 endif
 
diff --git a/scripts/Makefile b/scripts/Makefile
index dccef663ca82..33258a856a1a 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -12,13 +12,11 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
 
-ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
-always-$(CONFIG_RUST)					+= target.json
+always-$(CONFIG_HAVE_GENERATE_RUST_TARGET)		+= target.json
 filechk_rust_target = $< < include/config/auto.conf
 
 $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE
 	$(call filechk,rust_target)
-endif
 
 hostprogs += generate_rust_target
 generate_rust_target-rust := y

-- 
2.46.0


