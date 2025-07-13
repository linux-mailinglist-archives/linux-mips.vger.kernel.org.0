Return-Path: <linux-mips+bounces-9802-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34EB030A0
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 12:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7DA9189D4FE
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F399230BE3;
	Sun, 13 Jul 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="RW8uIXU7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226B1EA7EC
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752401506; cv=none; b=WZWBEuPCEYnE2vKP+R6FIu/LuckbaczX5ivFdHsEALoFKh+xIqO1HL3L1JjAvOgBQaOb/1ThPpDZ15CLefWMaCZF2gAuiTj7niX80Na3oe7EcK90q5N03sW+35qsiNEOvtC7+J8tDBAOShkDZG/Nfwdrvu6UX4/+BN3x4S1m/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752401506; c=relaxed/simple;
	bh=7UM5mEoey7PEKksdJooWHSimNR/8c0AfBbsvteSfT/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mWKY2+T6ax3UD6r41iUqYY0tsEV+iATB7fY1J3/+fqOcJClnHtrn74C4PmoRyexVDzas8B0A7j7g0Ad3KeqR0cKbznSaoZjgY9uOo47xlLLEVOUSh6jP7KKfZ8m6TvsWmYyEEzmct2N2cKf+S5jSWRwTZlLmOdtY0AxkGdEsSQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=RW8uIXU7; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 17373 invoked from network); 13 Jul 2025 12:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1752401103; bh=f0il86unJxnjlMtR3OgV459XJjJJ7WM8noCKcs3k4jc=;
          h=From:To:Cc:Subject;
          b=RW8uIXU7N3oZebj883aNv9B0KikraYoR3lPazZmeMTf0PFmSa2KO0Fcjvb9Iy9B1+
           UYTC61WeFLF8HEMMk7x1j3GpIqVf6+Tbvnpq1eNYWlrdgV9VOo/rxFh3ksMfb6fQJj
           Vw9YsDRNgzq4vhi1QoHnQy3v33fsyhZ2mA232IwJymA+iGGiCwww46PsqjpDbqeXuE
           l/LIfnRNdM8LxiJoRhmNICei+P1/IvAeuG+RfB7RLflFOfPIXzCREBp5jXQTbD9h7q
           4Z5i+vw0a39I9MC1GOTcZG2ggbn/zyYAmAKQzKNpVU7NnGaxE1kZjx/zDHWK1ft1JO
           lUcpgWIN7YrJA==
Received: from apn-78-30-72-196.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[78.30.72.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <jiaxun.yang@flygoat.com>; 13 Jul 2025 12:05:03 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 0/4] mips: CMOS RTC refactoring
Date: Sun, 13 Jul 2025 12:04:30 +0200
Message-Id: <20250713100434.699843-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 0efc514e0fa5e169df36cc5d3a6d6d8d
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [0VNk]                               

Hello,

A while ago I wrote some patches that refactor a bit the RTC CMOS support on the
MIPS architecture. These were in response to a bug report about locking
problems during suspend / resume:

Link: https://lore.kernel.org/all/CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com/

Back then, I was trying to convert the rtc_lock to a raw spinlock. This proved
to be unnecessary and harmful, but in the process I removed some dead and
duplicated code that touches the MC146818 (the chip of the CMOS RTC) for
the MIPS architecture.

These patches were tested only in an emulator, as I don't have the hardware.
They are roughly in the order of increasing risk.

Greetings,
Mateusz

Mateusz Jończyk (4):
  mips: remove unused function mc146818_set_rtc_mmss
  mips/mach-rm: remove custom mc146818rtc.h file
  mips: remove redundant macro mc146818_decode_year
  mips/malta,loongson2ef: use generic mc146818_get_time function

 arch/mips/Kconfig                             |   2 +
 .../include/asm/mach-generic/mc146818rtc.h    |   4 -
 arch/mips/include/asm/mach-jazz/mc146818rtc.h |   2 -
 .../mips/include/asm/mach-malta/mc146818rtc.h |   2 -
 arch/mips/include/asm/mach-rm/mc146818rtc.h   |  21 ----
 arch/mips/include/asm/mc146818-time.h         | 105 ++----------------
 6 files changed, 9 insertions(+), 127 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-rm/mc146818rtc.h


base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
-- 
2.25.1


