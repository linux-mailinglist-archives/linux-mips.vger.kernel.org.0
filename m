Return-Path: <linux-mips+bounces-13435-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLItJlK2r2lzbwIAu9opvQ
	(envelope-from <linux-mips+bounces-13435-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:12:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04794245B8D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50C6F30523D9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 06:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A052D314A86;
	Tue, 10 Mar 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6aNEl07"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75354314A79
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 06:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123140; cv=none; b=GXhADBMH2S1j8iirHtmePccXP52hvCb0N+YnLVcf8yazLtCW/aOpJ2WzCrTwiBVDvmTTIa4m9iMGMpYHsu4Iqx74Ok/CDYLbNgAztO1hKmalmX93Ew7xuW3Wuz3gANzW0j9YsuOQD0O2QxFKnLBq7Knb4NAyF/PfHWgh4huZv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123140; c=relaxed/simple;
	bh=2zz5RnScCUMkzHONosF9yEW8ZXBLhntgWYXPYRZwkYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z6058VoAxAdFp2R64d0Ye9Aj2HKtf19L0PkWuzsOJpN9vOkvBb7q1OT4x5Tx7hqNWvM7R0flaxWsXf8hRLfLR8UDkJExZsnwhe0tGo92AbtUAo/0s6ULwDXmbMk34PVcmqWpQVtnj/2PW2XUKlJqtUEGlmqujS8o8Vn/ayVyc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6aNEl07; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be19f05d7dso638408eec.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 23:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123138; x=1773727938; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ9KmidaRrJqyFwsMVgxQzC62T02yMtxzxJg/inqp4A=;
        b=A6aNEl072c5J2qM3hQY4d7bEhuEaChrnqzHG6g524djTh7dSOXAXJ2IN6zN9XFXecB
         rflAteUE/3fX6Ctxw+3yG6uQO8tgJqf7c0lZ6u8fYK1TPj3MPuE6PzhMpFCg3ECRZGvA
         uyjHY0PBRq8yGxlfbeujYgPxYg8aV+/HYG2tblncbmDeJapnu7B9onBD2WVPVRMN84HK
         WW53cSjk4ghabNDq3UiY00dO5MY4xheS2rQQKS/5BFjTB8xZ8rrIBE+4d17z1MEkpPCC
         7dh0AGJksSsskFUZ0BFmu7I4hr/0SBiEK6R9AFFTmcWkY8TrJWKhF4HarB2WLx+xxzcu
         tUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123138; x=1773727938;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ9KmidaRrJqyFwsMVgxQzC62T02yMtxzxJg/inqp4A=;
        b=XDJdy12N5J5dFCnRR/FBGlTVwZ/7626CNNLWS73kLx5A2yyZWvPKPuiv3XSOyOtzwN
         ezXmK4p3zJBpS/ZtpBuXhf/cOemnqiZ1WeysLLvRWAxO4bTiXP/bf1O7ewuwCxXzu+MR
         EHgXWJsNc+wHTQg8Eub7oPizpeZC3u0/VTa4IdkUUH/Go3Y3ccpxqyEIZ+5sR2/O4drp
         7eZ2U6wTL4YAwDdfSJ9ZqWqsTXFvEIbkA0YMSSEQPA1pdDiq/zt0ytzaLXv1GX8wtLrd
         3aVy7xsVFYyapCX70sT89efI6skVDZfOb27MI0V6rjsydbj0vV1uHHumKZzDikCzyMPs
         o06A==
X-Gm-Message-State: AOJu0YxirfYSeGwf5prCW8Sgs/r7sgOwIVH5day1ges35/FC1y2iOhnx
	TYIleCxAWxg1/I5h54fwYk/9v64m3NzwOKu0Kr+tVnhSzA4GCrGYaM9iLdN2cQ==
X-Gm-Gg: ATEYQzw6Pscu+9d1pVYHnhU4qAELk3Nrc2zMQzj/VJuPLncPIMeipwxw0XpqhDYv0Ri
	x4O+tA/aFFYZrfwq++Ovw4AyU8TJnoNrvfRB3GvqWp3gNe89rj+jYSxSLqyy3yWdUCz55NY1Z5H
	WJFNDjM8iSdQ47VS8cXKWkZVpOwy9agfU3VU5ZpGg+ZI2UvgnNIf3md5YX21G5Evo4NS7nTRxiP
	m+b7l0ZrceSWla5QVwysdQb73iNdaD7kIGTcyruFu4pwbPUejOBcUNkREcJs+wck2XOzndEJpL4
	drG894JIuPSinZSS2FY4XzQNkQcwiRFzvVWeHLiMdko9p0k/fkqVnFD6mq1m1zZu5XEQNl4YtBG
	xTs4ToX7vfMnSfaqv3cfh4kC0Ueom4rreTeg8x2HRGROZzPC7tUVb9hMxFAczxTVQshHgIJ7LZJ
	G0RfSU3Yb8lvtMxMKXXvJSTeBEQCSz+3q2dL9nnP0cmUGzZUvVaTUkhoNX80jBrvalgny/Re45e
	55XbLOd2CUIlcp2gkUpXwbZew==
X-Received: by 2002:a05:7301:6895:b0:2be:ca4:e144 with SMTP id 5a478bee46e88-2be4e04ce65mr5882948eec.31.1773123138307;
        Mon, 09 Mar 2026 23:12:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm11787106eec.26.2026.03.09.23.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:12:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Date: Mon, 09 Mar 2026 23:11:57 -0700
Message-Id: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC22r2kC/y3M2wpAQBSF4VfRvjY1iMGryIVYzC7HGUTy7iZcf
 qvVf5GFYVjKvYsMdrY8jQ6B71Gtq7GD4MaZQhkmMpKZqPpaYziFSoM4RasAmZB7zwYtH2+pKD8
 bLJsLrv943w+EkaH4bgAAAA==
X-Change-ID: 20260309-alchemy-78158ef7ee06
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Rspamd-Queue-Id: 04794245B8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13435-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series of patches updates board previously converted to use static
device properties/software nodes to attach and use nodes attached to the
respective gpiochip devices rather than simply defining unattached
software nodes with matching name. This is a requirement of newer
gpiolib code. Note that there is currently a workaround preserving the
lookup based on the software node name, but it will be removed soon.

The additional 2 patches convert the remaining 2 boards to use software
nodes as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      MIPS: alchemy: mtx1: attach software nodes to GPIO chips
      MIPS: alchemy: db1000: use nodes attached to GPIO chips in properties
      MIPS: alchemy: gpr: switch to static device properties
      MIPS: alchemy: db1300: switch to static device properties

 arch/mips/alchemy/board-gpr.c                   | 122 ++++++++------
 arch/mips/alchemy/board-mtx1.c                  |  79 ++++-----
 arch/mips/alchemy/common/gpiolib.c              |  45 ++++-
 arch/mips/alchemy/devboards/db1000.c            |  36 ++--
 arch/mips/alchemy/devboards/db1300.c            | 209 +++++++++++++++---------
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |   4 +
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 7 files changed, 301 insertions(+), 197 deletions(-)
---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260309-alchemy-78158ef7ee06

Thanks.

-- 
Dmitry


