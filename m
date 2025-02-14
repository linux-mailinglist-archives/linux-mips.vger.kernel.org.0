Return-Path: <linux-mips+bounces-7768-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19850A35BDB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 11:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1FC3A6C97
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E362627F8;
	Fri, 14 Feb 2025 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I/EAPNtQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C01245026
	for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530268; cv=none; b=RPEMhx76cJmk4oKrifPzxtVGe8//GFN9PcyIv1JJHQbFStrD/WpaWR8bnbr9QSqsp1tArMf9LIjV9kf26O1RkH/nUcSuOwc9zimk9tUbXuPoMebIT8GGMWeifrmE77U9hPw9v3pqTYwKnmx90iKdRyFCbzpxzAl1Fg6znhFVt3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530268; c=relaxed/simple;
	bh=uOmdwsErYI2TXvFPdID0TlewhOZbmAK4WYQksi9Me8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAT7FMCHppToGD31Cjcu8joSyy0xwNp9AiTLoZPOg2c9lzcbdf+TX56p394V2wqsAPUsRpypQn0jxt38RgpkMDRneskQr1wHS1BJlkE/ZnYy8B0MzCVt9C8XZ9c6lbTVPXkvCRHpqV+cez0LEkvE2WXG5Cf/yHgSnbK3zd5haEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I/EAPNtQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so351236366b.1
        for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 02:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739530260; x=1740135060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKrRYi2DcewiQ8UFnMsHdUIKuoHMXLq1gLMqIZNXnR4=;
        b=I/EAPNtQ3ZQuUbk3GSDv55zl+qgRzROIp+GBol8h9qQQvCKpL9aUdFAMiUgS4G2VpT
         LSkT9aFZG/k6qod1d85Z/rDLXU0l1m4lKgURKkMqgCQAko7/EoOA58VDB0hGS6I6iHga
         5s+AN9AWuiATV3IIzFKSrXiyIUxFv1AmKtGrVcMBWBJaeX08EwkIimetVm2g6+IBF+46
         FkxqZr0mL1wbRKmklUm5Csl0s1g88KBji8palCc1fj4Taxop8Ld9hoTbamDidpssmNoz
         pv5E002bXO8tV+jOYKg5hqnBURcfhoEn2FfPTFKu6qxr6zmIuCyvTVM3LYn5JU24wvbj
         HLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530260; x=1740135060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKrRYi2DcewiQ8UFnMsHdUIKuoHMXLq1gLMqIZNXnR4=;
        b=pVqxI/XIgPDSbhRX5Qo3DuOp61kcrXEZnQyC8JMDW+5MrCBw334n9u3H5pvG5AJR9/
         VnReoykz1MU9BEf4e77VVJQLesNKYdf3Ah9Lby1B90j7Sn7pw8FgTD4bYQCeDAzmEwTG
         MLMgUvYW+jVw51XJ4XGTgVhmtGzaoL684yO5CO/5vfcSMiIOQ8uNfYk6u8OyjBYCaCqP
         Rld4xH40m1RNRVkqRSqZbu+n2V62TppS7SdqS9LNCGlh5xCRGCWzy1w192WvvG8xk9a/
         c+OOhTlkXK9d/On2YREsC+8TU0h55xgR5ufkedvb986tXbYpp7GDZVMu8Oi/TDH/lo7k
         XTdQ==
X-Gm-Message-State: AOJu0Yzq4OgCYx27is/J6q0Pjmg7sWlLr3EK1cxOzrYB6vyOXDn07Df3
	QSLNgjZm0SsNXkYRHUBW9MGJt4TAJ62t110iLRo894fdhnBibwec8yDPh23l4biqrbcf3324YNh
	Y
X-Gm-Gg: ASbGncvECAMDXQiT1hoc3Y4nR9+zw+XZGXHpLcEfuqiIPX2dfplVqyhp41ACQ42wnK8
	l4mONipfHvmJEqLOU/689Hh95cp2pNH4YX1ixo1jmZvJCPxG1U/ISXi2BEaIfp1alnv09rhW2Kp
	+1E7c+LwnH/9RG6V9F1AaBSickV//bESfVd3GoCqcyhlvip1WChfzkEW322DqaZwG6Iokj6QrNW
	Ee9awvUdf3ndbWGvscWi+DMFoUi/kcyuNepV387ygKrXNuo00nN/mlTHrRR3bUzRU0wljypowSO
	kUNVVCwwdw5Gr+p/+vRyyqQj7gjgpH4WS/9j/ac=
X-Google-Smtp-Source: AGHT+IF+nI8uaFR5F3xBn/U31UKTP0rILJYX53CQrzbkQArWkDkAxcpVmIkFW+KNudbG4M+h4swvsA==
X-Received: by 2002:a17:907:2d88:b0:ab7:b896:b80c with SMTP id a640c23a62f3a-aba50fa0b94mr511634166b.9.1739530260452;
        Fri, 14 Feb 2025 02:51:00 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532575b8sm314551266b.44.2025.02.14.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 02:51:00 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH 0/1] MIPS: Fix idle VS timer enqueue
Date: Fri, 14 Feb 2025 11:50:46 +0100
Message-ID: <20250214105047.150835-1-marco.crivellari@suse.com>
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

Marco Crivellari (1):
  MIPS: Fix idle VS timer enqueue

 arch/mips/kernel/genex.S | 36 ++++++++++++++++++++----------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 20 insertions(+), 17 deletions(-)

-- 
2.48.1


