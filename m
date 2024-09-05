Return-Path: <linux-mips+bounces-5358-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951B996DA62
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 15:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6BDA1C22EDD
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 13:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E67019D8AF;
	Thu,  5 Sep 2024 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="1Pws76qz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A49hOezD"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87919D89F;
	Thu,  5 Sep 2024 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543206; cv=none; b=XNH51kXC3kiwvkdQWCepL3VYY3j8048stjL1vT6bTRKU54Xpp3DvanOVGq4424MIdmfksKtHlBRTyI+8PvK0aiJhmO16sZrsXewhrNCUZqkzVJa63HZN5SvHRXEVwNqpCMepkz7qOpspQEP0fx7F5eosg1+pXS9vWGGmJn0OUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543206; c=relaxed/simple;
	bh=q9PK02pd92y+v95I+RdQsTEBNzvKFSGnPjB2K/vbR1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IAAt5gD8leOJOq7T834PNDM1KYmbdLF62IQwsIKOUc6mexVjvpkVOb4ccVJiQAZo8UkvZqS1PFJQjZAqFa4sBYltyzRVdHS0YSRPUrks3Gf6NvRIYZMB3QOilQ+KvUp4W3Ju5zSqNYRCVRePAgA2E/YB05Sbg62N+sNYc/BYQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=1Pws76qz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A49hOezD; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 65A101380053;
	Thu,  5 Sep 2024 09:33:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 05 Sep 2024 09:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725543202;
	 x=1725629602; bh=qimAV3wto6Axv7quLFDukEk8DBO0+3lc2rfy5X5Nb2s=; b=
	1Pws76qzQNZM1pa1R+KK6JsBF3Al4dbNjWYmyzUrwIUI+NvaGLSjzc5SdBBrL39W
	tBgJ6p27gWFXKgrRj0xqk262W5X55vQJLXODRqhx5hcnrdqpWkmPvTmyvHorVOJ+
	AO0I5/7PqWAj02Dtup8WABYQTdo5Hp/kZv/m4fjuqONmUbOVQq+Y+LeMIh5vtsSU
	op8kjSpIgRx9/H/Ow+4K3vrtC/qCUXiyclB3RxgJ+WpfUw34RhGEAEFTl0Tbfs/D
	A3HPt/5CMUWW0QiDEBRmMwdAOS9qDts5Rfv6T9J5Eoyo+XF6BXouex0eACOY9aVW
	/mV4m8YtpqDGjwE/dyUgFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725543202; x=
	1725629602; bh=qimAV3wto6Axv7quLFDukEk8DBO0+3lc2rfy5X5Nb2s=; b=A
	49hOezDYQg+JjV7UcPnkQoEUBGJ/TDSUkAYROcKNbAG/N7BwFq63a61MsUc9Pgh7
	UWJhAMLP9XgkfxL1c/P/TgttJ4nE/q3aSl5vhek7IvXzFaZ3usBMYs9D4rkoydZm
	Im/6kP2dBgnW+259kyYfXye/gsj5YBxQ4abq8mPDtiJ3MPKZXSGtcBGXIptjf2eL
	88v+NsneTSV1KCmgNwarWwH/kalUekqAwqKDh9Jtw25/fzMI5V8NfKgt5JOJpqox
	o+dfu+eMHIJnJjR2fabdRm6XoiAy8an3bKMZRFucnbBuU9/H9X2TS5BcOQYN+1K7
	rLlziB0/4kstO41pINU5Q==
X-ME-Sender: <xms:IrPZZmPK-tG53VZTF1yJlr_KIDkpizDKB2tt1cgJMdVp4MO4lvJDwQ>
    <xme:IrPZZk86127yn3f9DxcmR2qhKqpNXiGEJofAna-UpauIxTcknbwrM5kqpSmqljhz5
    VGqOgxr3QAJS34rGjE>
X-ME-Received: <xmr:IrPZZtQlO8pi3UueL6--QHrquCTSXvTKNesWgI_m-Ou9ogjUwm4C_N2xWv315MklQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnheptdekieeugedtffetueffjeelvdek
    keffgeduleegudefkedtgefhhffhieegiefgnecuffhomhgrihhnpehgnhhurdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepgedtpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehnuggvshgruhhlnhhivghrshesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpth
    htoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgr
    mhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehsrg
    hmshhunhhgrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhmpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epfigvughsohhnrghfsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhi
    phhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IrPZZmv_fjshiZqQwvmYIbQhZxnnfwKkI4D89NNOOhJz18t8mrppAA>
    <xmx:IrPZZuemdOt8-L8LY-ntSYMH46orQKjLcWX7-C4Urw5glkMqEcacUw>
    <xmx:IrPZZq02eb5b6ungje_adaPAXH8RRI_UpTZYjuMgsLx1V7D7G2vGsg>
    <xmx:IrPZZi9H1eD70w28nUL9flejLuuNfNi69wtEIuctdbsqm4tNADt-aQ>
    <xmx:IrPZZuTuQhiJCBkDnaV8cWfPz6_ay8z2FA7uuQfP42twGjlw8C3LZHDV>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 09:33:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 05 Sep 2024 14:33:05 +0100
Subject: [PATCH v2 1/3] rust: Introduce HAVE_GENERATE_RUST_TARGET config
 option
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-mips-rust-v2-1-409d66819418@flygoat.com>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
In-Reply-To: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4405;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=q9PK02pd92y+v95I+RdQsTEBNzvKFSGnPjB2K/vbR1o=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSbm8WZX2o4zdgxVyZfmPWpzcW7/39KRB/htN5QpH9If
 eOqrW9/dJSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEPFkYGdaoZFjN/TVR8sSp
 hWK3ZWLWFqvr9p4Tjn/lcuuZ8Jp7K8wZGe5GJrZPidTY8fb3KsaNHVolOa+WCTmGOZ17yFpbmPl
 1BhcA
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
v2:
	- Reword Kconfig help
	- Remove x86 specific condition for UM
---
 Makefile             | 3 +++
 arch/Kconfig         | 8 ++++++++
 arch/um/Kconfig      | 1 +
 arch/x86/Makefile    | 1 -
 arch/x86/Makefile.um | 1 -
 rust/Makefile        | 2 +-
 scripts/Makefile     | 4 +---
 7 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2c1db7a6f793..b183855c34ea 100644
--- a/Makefile
+++ b/Makefile
@@ -807,6 +807,9 @@ KBUILD_CFLAGS += -Os
 KBUILD_RUSTFLAGS += -Copt-level=s
 endif
 
+ifdef CONFIG_HAVE_GENERATE_RUST_TARGET
+KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
+endif
 # Always set `debug-assertions` and `overflow-checks` because their default
 # depends on `opt-level` and `debug-assertions`, respectively.
 KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
diff --git a/arch/Kconfig b/arch/Kconfig
index 4e2eaba9e305..0865ff4796e7 100644
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
+	  needs generating Rust target.json file with
+	  scripts/generate_rust_target.rs.
+
 config HAVE_FUNCTION_ARG_ACCESS_API
 	bool
 	help
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index dca84fd6d00a..6b1c8ae2422d 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -32,6 +32,7 @@ config UML
 	select TTY # Needed for line.c
 	select HAVE_ARCH_VMAP_STACK
 	select HAVE_RUST
+	select HAVE_GENERATE_RUST_TARGET
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


