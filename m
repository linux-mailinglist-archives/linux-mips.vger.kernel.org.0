Return-Path: <linux-mips+bounces-8025-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C367A47FDE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 14:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2301897985
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 13:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5E42356BE;
	Thu, 27 Feb 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WNZmzX+W"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7FE2356B4
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663954; cv=none; b=lbCeao5lgdWsPhpw+cB57RSlxeoO5fO+A0opZHQ/MP8Ztel0TaOMPnNcKsYsaZR2kQXUhMhVxYy5OfVjzX6VDV1pIELPBgtl/jgx/VzQ+OeLlFbqA7TdqQGIJK9Ik8QDN1iKAWgwzrRDUVSyTRcaakWOaOfM9uJ/nyfcIneiJIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663954; c=relaxed/simple;
	bh=DN4L8XiO/ZiZHQzxZriFPSaUZlt9cpmpkm9a2OnGF34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6f11GW/8UU6B0h9EoI2KgqyK7TSPjzPRmSeqPImF8vnYjkFJ9tyMrlDGjfGqbbJl+UFNLBIMYVq0xqUAwtgPdagvz47S6R8DmpE5I5B3pe6euKypUqR/czVn8kJbXKLS+2o42ElY6O6UZ2iTi8Np7WUJRqik2w0La1HAYy4YZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WNZmzX+W; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f5fc33602so670534f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 05:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740663951; x=1741268751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGQnt5hRpa/WkmZ8nxEca9c9CkE5rmVoY/G7NcVEo2M=;
        b=WNZmzX+WMNwj0Gqgvrq8SOIxCkqxVfZKBiHFrnBXIL2TPOd9WOPXZtAl/jGWJpiuN9
         cfha+rO4JqyOUSGoT9rYtnu4j0k4YgZmhwnPRVcBbCpLTGEa9EMsPE9KU+HYz7+0/NN2
         uRbMfOGo5Xw5mQMxnQW2h63gw4xbCQL2BNsH+CWEtQW93LBLNFVXPVCIWMRmuaZdukqp
         mR4A0rzsstMdJkTdcWRxKs9WiNECSDN3xfG/2GwhDjYgbvsNhrgD6oa8NEUF2sTbgBlL
         CavkrK7AfrcQceYf2KKJtPvk21kcQT4zMPAw8SscjAt1riCMNCEzx6Yn8NOLETTwZ+j+
         pNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663951; x=1741268751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGQnt5hRpa/WkmZ8nxEca9c9CkE5rmVoY/G7NcVEo2M=;
        b=ms2TNTLZHQopnXBowcG9UjzCxkgGXQ6JhG0YCHcAvK2aslYbJs+UGvvJgC/1gjeXFZ
         gV+2qZ/yWIx+03mh2ZgJ78OoWYol/BXH5z8CVVBridmlAuk29Weohz/JRzENoOnvdL4R
         alyxfxs9iKn8+ULoHuIRMNbCZx0wnvPoibAnr+d1h5eUYQfPhk7kL+NGnwOxF+5IwRzK
         mKHRIYhfSd7JX2qjq9wfGlpkXUxIr5zWH+UZhqa7WTSZjfn4CW2CyHBlPotD21yR5sJv
         S9wYQqdfwiOkpW2iNl3YM/0Hk8BWYwBJbRCNg+tigmEJHncb4l6GayMsSlJ+l0HBC5LW
         Rvgg==
X-Gm-Message-State: AOJu0Yzn0O08Q+fgljcqZGVJhzZ4LZkrolazt8uWhYg/d8zgzRVLQ/d8
	vsl3GUl5o5x0m/gC6vOOkkEClfcLCnHHjxBM7YYCvktItzQFUYzszQjmEhgJ54G1x54VzsywFH5
	c
X-Gm-Gg: ASbGncuDt3GDkDHOrg9uIJq7+hj6JSe+Cm4quc1QEjNJbis8vQ5lLspuhWq8OajSTLq
	IsE0VmbFybsc51CEB2dxzQCM8Kp04IGVXp2zmmOy3t8iVrnrb2oE+GSkMQsFPwVK7xIEQW2jI1V
	8JExyUYlsCzAA876JmwofBj7lkoviGcZshXwxhgEECvMUa58oRRAXnvWZDz1nJfki59C8A3w0+w
	pR8ssGgweaGia8wu+74Uf9mRKkXNVMqvJ3PiiQFwx/cYx7hkC6oh93MCn2o5Ple/8stprao0p5Z
	RiPE+pQ3tk+kJgHpjOwEFSo9OS/sP17uW7B5nA==
X-Google-Smtp-Source: AGHT+IEiCWqrduAOLZxpuElcccKeHTR0Gejhv1QsxlgggvIlFVbf1lQCCkOKANvMmmoAYK8EUYhVvQ==
X-Received: by 2002:a05:6000:156c:b0:38d:cc9c:630c with SMTP id ffacd0b85a97d-390e166b1bbmr2598483f8f.10.1740663951082;
        Thu, 27 Feb 2025 05:45:51 -0800 (PST)
Received: from localhost.cz ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7b6asm2174595f8f.51.2025.02.27.05.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:45:50 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v4 0/1] MIPS: Fix idle VS timer enqueue
Date: Thu, 27 Feb 2025 14:45:38 +0100
Message-ID: <20250227134539.267169-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aims to fix idle routine while the CPU receive an interrupt,
because __r4k_wait() only checks if TIF_NEED_RESCHED is set before
going to sleep.
The same behavior has been changed in LoongArch [1].

Code (cross) compiled successfully and I manage to test it on a VM
emulating a malta board. I ran QEMU with:

qemu-system-mips64el -M malta -m 2G -kernel vmlinux -serial stdio -drive \
file=rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -cpu 5Kc

rootfs generated using buildroot (malta default configuration).

- [1] https://github.com/chenhuacai/linux/commit/a8aa673ea46c03b3f62992ffa4ffe810ac84f6e3

---
Changes in v3:
 - changed "daddiu k0, 1" with PTR_ADDIU k0, 5
 - replaced CONFIG_CPU_MICROMIPS with 3 _ssnop followed by _ehb
 - integrated the commit message with explanation about
   CONFIG_CPU_MICROMIPS replacement

Changes in v2:
 - Changes introduced by Huacai:
    https://lore.kernel.org/linux-mips/20250214105047.150835-1-marco.crivellari@suse.com/T/#m75d9c587829e15e0d7baec13078be4e65c936408

Marco Crivellari (1):
  MIPS: Fix idle VS timer enqueue

 arch/mips/kernel/genex.S | 42 ++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.48.1


