Return-Path: <linux-mips+bounces-12449-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC480CB673B
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 17:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4398300CAF6
	for <lists+linux-mips@lfdr.de>; Thu, 11 Dec 2025 16:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940142D23B9;
	Thu, 11 Dec 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myiFxaxZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DCF28688D
	for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765470499; cv=none; b=Ft7BcDlseT/DVfpMc2qWvSeiVKLZqjG+obX6epvnaPxX7S+K4DzwAvv8Egz4jxsuRSYi9JmwEq5+5VI835wpR9Qs3Lx31AIGT4N0xvu44mUGR1YSD3cBvEB5QEw8Z+/J8BRtGqTTGwiAm4SX9baYTPl9SZyuZ3PvoMT40QAcm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765470499; c=relaxed/simple;
	bh=R1j9NzrQRCuu+P4uP+9JzmGX68GdASms1HzzcgLsZIA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=a69UkjAcrf14ZHLs955ebfTF4KltLANYzez/KgjbT8l2JGq2sNRWJlpAogYZtiWYfVJg5bJjcbARE8oaWoEd/2JUfiKlbNaGMy7xwzpj8MHH4lZ3VDE6qbSuLJANjGuK1mvT1MTu7d0bTwpOxVhO73VrinMhy0krMpRBsH9LvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myiFxaxZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-596ba05aaecso333946e87.0
        for <linux-mips@vger.kernel.org>; Thu, 11 Dec 2025 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765470495; x=1766075295; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R1j9NzrQRCuu+P4uP+9JzmGX68GdASms1HzzcgLsZIA=;
        b=myiFxaxZm4M+mCRsBejjRWev0HleZIkzb+l88JFPYy3jDwgN7hrT1aE6TawDFxMSa9
         pNuhoWwsYtccx/U+Vd8eecSD93zxg2T+2hI+O5HzjCM56z9OIy1+k46n86d0V8i7J7nx
         zS+EelOILacz8GCPmX+jz39WSsvjOuw1YR1flInCT+U/8iQIAdfjpGHzLWLhrY88VYnt
         qRCSMdwV9TAeiV1Tbj2YsAdDlSO+FM0pMIkmt/g0IDSR2AYqK3bwidC1PRFsEjNcHoKa
         TYtrXttuZFIDKVxDSr3dJQ6GIs6HBOxz5Tfl1nn1LHOM0+hq1xK6g8HeZ8EG1bwXENCI
         gbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765470495; x=1766075295;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1j9NzrQRCuu+P4uP+9JzmGX68GdASms1HzzcgLsZIA=;
        b=dRYSIUv4RE2EAzzkSDc2yhNWMd+31zLhvLB6PeRMeKVRlEGFM2GjrgcW3SAxK7ssqe
         sLzHuFYrFC5xXxN6qSgRch/ICOD6H+Yt7mB5im4SlzF9GIvJX7o7PEftwTQNSwozlmhG
         z85MqU/RdrPpZLd83fFuDlfsEstB+cGzzMNafaW81R70kNtkmq3Ax24sC4fYYfaIMSYx
         171TdIPGLWTMtvjlmxvmJ+wK5edSF8E2dmJ+XV27lz2tBke40WxeISaWdbjW+EpCvyG4
         exTKTPGwQi/axUW82Dw8T4ZGM1WzpjBdH3x5tMhGUWxzZ4ZgmmXAsK3tMXQNgpE20tHL
         vGMg==
X-Gm-Message-State: AOJu0YzjzyK5IrkROS/z7R3hcT/UKOaYelJMIfXOYfsmISiC3coZ+1jO
	RvnCKLftRVf19ecxqZCEzG0dMGAELoxj1FYqWdSspxAioF5WxdZG7bmW9caITsLuzqAp/4sGz+J
	6B/CKfh9hv+f/5dlC8rkGUKCTLudmJgWOGwYu23QKtA==
X-Gm-Gg: AY/fxX5OWI8oydmCiFzVaShMCyaLnH99WwP7jk2TrHyd/Rkq9CgH98nXd8REyFRPzgi
	gctBLsd6Wer6GfZmbtOuchr3Q0CMLWAkCbszDnkLjPmkQVR5ILwZ9Lba2h7znqAg7RY/92bjvUm
	evBkYwI6KVuIGdbriJd1z2rIvPFx08mWPi50wffkpvw6s6YfdJ38IFJ8K1EmLZ2MDZASiSmL5Oh
	01iokX9UldBAqEAVXTxrY/8eU5mLvU2i6vmLYDcC3zsDzh1OjqndKsSXIUvadGT/GJ33/0XzJMj
	a1lxsJOlspqwxI9HfPIx/OX659rmEEx+tzQds4Zr1cKYngtgYL7un7nCRJlaIn3GlOkezCJMse8
	o89V4ngR9Uxwp0RO+MebrzgfznQE+GYxxaMYVUYjge6+lkDT2ZJvSxY6DqpsRf6d9QU7RABzsCP
	C7nlP+h2Q5fPE=
X-Google-Smtp-Source: AGHT+IGhnGCwkZ2vcz6urQri/uq0ZrLdBcxUXGBzRs5D6gwctAnaUVhmjEdsX0IKYMhBt9f4qghXzyYVG07QdXmkXMM=
X-Received: by 2002:a05:651c:3134:b0:37a:3d3c:3161 with SMTP id
 38308e7fff4ca-37fb208751amr25653081fa.15.1765470495282; Thu, 11 Dec 2025
 08:28:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hunter Rules <huntersschoolstuff123@gmail.com>
Date: Thu, 11 Dec 2025 16:28:03 +0000
X-Gm-Features: AQt7F2ql4iRNxv6PIXuwPv6iI7hNolxwa0MQ8eBJo06Rjvlu3w3OAWOogObb9wg
Message-ID: <CAOoiW7LwuXB5o2iPtVs4gDDoL3i9vFK8p=rg_JHfa4V6vraObg@mail.gmail.com>
Subject: Attempting to extract a embedded Vmlinux Image that has no .ELF header.
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Im trying to extract a mipsel VMLINUX image that does NOT have any.ELF
headers, but it 100% of a valid vmlinux binary in there perfectly
sealed so I can run it in QEMU (the 2019 version of QEMU, as mipsel
kernel support no longer works on modern versions)
https://files.catbox.moe/55zxkn.tdf
Original name is AppKernel.TDF

I know for a fact that this is a valid vmlinux image, None of the
infromation is compressed or encrypted. However without a .ELF header
loading this is useless. If possiable id also like to see the config
options although not likely.

The kernel is based on Monta Vista although it is pretty much the same
to most other distros

For reference here is what a valid Vmlinux image looks
like(https://files.catbox.moe/55zxkn.tdf)

If any linux wizards out there can tell me if extracting the config
options from this image or even getting it to run in QEMU for having
the same exact same arctechture would be possible. The actual VMLINUX
part is 100% there and not tampered , but without a proper header it
just will not open.
Thank you as the reason I need this opened is for a operation im doing
that's really important to me.

