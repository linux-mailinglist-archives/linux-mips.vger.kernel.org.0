Return-Path: <linux-mips+bounces-5357-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0C96DA5E
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 15:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EFAD281D77
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 13:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C570119CCF4;
	Thu,  5 Sep 2024 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="PdMvnsb/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y+Nnp21a"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74401E487;
	Thu,  5 Sep 2024 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543200; cv=none; b=NHLsZwaaytB2I8WrETETQSrO8mOuS6vU2tp9TWqTq0pzg5S2HS87xmYz+x+SCqq7DsH98kPTto9hkd6QMgg8DLpjueLWh/f+cPAkF7o7EUGNaRGkVmVhJnjPKyh9Hj0sj56vEaa98eHIka1fBmfUQ4uIlgbdDseUz0jAmlDjbD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543200; c=relaxed/simple;
	bh=qjUaAPTaliz5J4cRsvrBexPWV1blwkxxWIdH50rGLzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ts073V3bY3U9ZKOq2H+2lQVa3ZeTdEummacPpWiHnHxPUKPcXTHANsaMGmyn6LFg5wg9G+qyUw3emnneCgt3iZjF0YppTWsYM+aR53VrXNoomnqA8qdup45tyuZayVhflIElgYXi9/jPmOmv5jUhjEVh4x02CO+VFapdkJFrR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=PdMvnsb/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y+Nnp21a; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EB1F31140263;
	Thu,  5 Sep 2024 09:33:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 05 Sep 2024 09:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1725543197; x=1725629597; bh=0L
	6FxNpj/PudHapXC4OU2emJoWIjVzEfXLmyz4x/E4E=; b=PdMvnsb/OntTB8LKjc
	4FMd2sBTGmsLLu7Qc6v5dKt9ugU47ve2tbKW8tRsjwTvSOpa7BFJ0APLPQlLss7m
	304fSR9XiLY6NlDBY7eVdXG0kX9uPdhd9IJiK5ZD4dgzi17d54p3+tCAnIank3fw
	610VKgvDZDpuCLRwLK0UlC84k5BYptDelvRbuqCNiGobkfDgUN0Mjmo6w9+N3oyf
	sNI9SCjfGckTG8tLsCX/avX1T+SCE3oUuolSbW1DCbBdszdSr0PMnaPmwKb8NdYi
	HcUZxqr29LMq/cxocz4vlmj2AY2ufhPdWBkYUpff33U6V7C+TaL2RVoTQjJzeDHf
	76JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725543197; x=1725629597; bh=0L6FxNpj/PudH
	apXC4OU2emJoWIjVzEfXLmyz4x/E4E=; b=Y+Nnp21aOOWlw1BXngSS0dK3Oq92o
	KQ5ffLqsYD+FSSZmFj5MID8NjE4uHa8QyOLkcI2U8v4Jr9gXcUa6qBAIFdVL8tGv
	sg1e1/w6q0M7cVrNgrdhOkQXmKMF9HQygSZSHd3dew5Hc3kWSUrTeO/0r7uZGDxv
	+Yrla2VmFJIXWiWqN8TIvXkTq21kb+atxoGVcqd+OJ5qcHODTUCi5UFG4E9MqDRV
	GWn2dW0cEumSKmBoymeXWZeJqibVzLkXkYnms3BUDwtzfh7HJKbg+RNO93cx9JvZ
	NRa6dhPtGQE9bXVY/hByM9O4KT5Bz6HvsE2qcM5DiL1m+/CsRApzVdB6Q==
X-ME-Sender: <xms:G7PZZmnLsLylXlG6CQGcPrlbeUbLhLJ2zr3dfhFTXOofyhf78O45MA>
    <xme:G7PZZt0NyQjzXWRGWkZWn_HzrTqE5Z8Af29Nh_g-lriJz7k7nnS-gzs_Cc0VqiIPV
    TTHYWk44hc8-W_hR80>
X-ME-Received: <xmr:G7PZZkrNK8WgPaP8q-p8iZyBsyn8bVgW4tRzsqvlm24rtEH7JJ_V6_iznrNJo_juhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecu
    hfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomheqnecuggftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeu
    gfegvdeuueejkeejteekkedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeegtddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepnhguvghsrghulhhnihgvrhhssehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtph
    htthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepmhhhihhr
    rghmrghtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrghessh
    grmhhsuhhnghdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifvggushhonhgrfhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhm
    ihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G7PZZqlQMv-YYB0XC88UY0jLTGZdF5L2Q-PtRXFzE349eMlE-oSi1A>
    <xmx:G7PZZk3y8wLJx7CTmrlsU_VCnz_yRFWNLstW-KImm0MMNawWM81JNg>
    <xmx:G7PZZhv1cRNHSfodrQXmL5dPrHRxtuJzSQr8sthoPTKc8j7PaViZFw>
    <xmx:G7PZZgUwPXtfzod7pnnUm_Ui6vsW6b5N_qtKmbHHY0F7BgVG7kM-FQ>
    <xmx:HbPZZtoSbg8Issh36bt-E_kNQL2RrHmisjXXArIsRPGKKIQsrMcS9Ym->
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 09:33:11 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/3] rust: Initial MIPS support
Date: Thu, 05 Sep 2024 14:33:04 +0100
Message-Id: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCz2WYC/23MQQ6CMBCF4auQWVtTipriinsYFrWdgUmEkrYSC
 endraxd/i8v3w4RA2OEe7VDwJUj+7mEOlVgRzMPKNiVBiXVRbayERMvUYR3TIKMRnK6uVlsofy
 XgMSfw3r0pUeOyYftoNf6t/5T1lpIIcmRfCpyV00dvbbBm3S2foI+5/wFnrA6GaQAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=qjUaAPTaliz5J4cRsvrBexPWV1blwkxxWIdH50rGLzI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSbm8WDZl+5WGVsyf1um8wVFU1W6U2W0X3qSl9Ppe27O
 eUcK4d1RykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEzk+S+G/3GGcy7/1rDjUWn5
 7r3Wwaiz+uCjNbYZWflG/gv/562f/Izhf1HrrqVry4N7Pys8+F3ncCC266zR/9i8mc2+weJhCeV
 zuAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Hi Folks,

This series added MIPS arch support to rust for linux,
hopefully MIPS is not too late to the party :-)

Sample rust module tested on R4000(el),mips32,mips32r2el,mips64,
mips64r2el,mips64r6el.

Please review.

Thanks

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v2:
- Address review comments on wording & style (See individual commit messages)
- Add microMIPS support
- Link to v1: https://lore.kernel.org/r/20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com

---
Jiaxun Yang (3):
      rust: Introduce HAVE_GENERATE_RUST_TARGET config option
      MIPS: Rename mips_instruction type to workaround bindgen issue
      rust: Enable for MIPS

 Documentation/rust/arch-support.rst                |  1 +
 .../translations/zh_CN/rust/arch-support.rst       |  1 +
 Makefile                                           |  3 +
 arch/Kconfig                                       |  8 +++
 arch/mips/Kconfig                                  |  2 +
 arch/mips/include/asm/dsemul.h                     |  2 +-
 arch/mips/include/asm/inst.h                       |  6 +-
 arch/mips/kernel/ftrace.c                          |  2 +-
 arch/mips/kernel/kprobes.c                         |  2 +-
 arch/mips/math-emu/cp1emu.c                        | 18 +++---
 arch/mips/math-emu/dsemul.c                        |  8 +--
 arch/um/Kconfig                                    |  1 +
 arch/x86/Makefile                                  |  1 -
 arch/x86/Makefile.um                               |  1 -
 rust/Makefile                                      |  2 +-
 scripts/Makefile                                   |  4 +-
 scripts/generate_rust_target.rs                    | 68 ++++++++++++++++++++++
 17 files changed, 105 insertions(+), 25 deletions(-)
---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240903-mips-rust-fa8efd836ce9

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


