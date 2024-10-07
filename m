Return-Path: <linux-mips+bounces-5782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7184992E0F
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2024 16:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B0611C22743
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2024 14:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F401D54D0;
	Mon,  7 Oct 2024 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRspQEpE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968BE574;
	Mon,  7 Oct 2024 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309576; cv=none; b=mFS7PByV5nGFFDGVW/rl/VOUI6X9F9TtDpToFVhki/hhonA9XDe0zNd9Je5ePRNjXnaOaFzsmx5zBv7b9W8T78Hl52hrHWG4rrRKwXS3dw3HNj9zkDttYcGRzJTuLzruT42EAKQRvtoH56AegSXGAdfOAleeKjka+UpTru61pSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309576; c=relaxed/simple;
	bh=c4D2tFJcwKKpOfBcISbbCxnM6psVd+aTip+l75EN1eo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rTVrG0KGvVskVFckh7SSJbDkL+CrznJpspv/sI7LhL4URdbkqvaAUIW74PV8ZsAZF0em3/FOZGribZA7J1xxZag7LePmp7YmunMY4cQDWGNz9tOtsYStBoMym/QIAczkCtnhkAbSIgKkvdbCpc0BDGHLd5Q+8XxauV15VOzyrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRspQEpE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c5cf26b95aso5857357a12.3;
        Mon, 07 Oct 2024 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728309572; x=1728914372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZA7sOYakjtLA5O1zDRt0AGiMrhjDOP7RuvFdqZmmnQ=;
        b=XRspQEpE4JAHaLYxqvmwE70QPWgjFmjaTiOc3Tpi4Uo9Ih8lbhBAKGlNL2HptitFZj
         PrvPjAquDYZ9Py5Y6AGsZbv6suxeGUxXiCu6rOQTTSXg2kyx1mGahdKgQWWJZLwoW+tK
         JTX7aDk2b/hnE8Ow9VAJKkWFMXm7ZM0a2KFvkChW6Y2clGj3GFpKk77UwT2a72c/FHFF
         RuqEAtlFJQvWiUKPAjHp1veTaZTHKQaSdzo/dnD8RONlPBuD9eM7xjvNrwSyHlN54ESu
         9s187NfSPm1AMNGoD23qiivdfLw4QU7L35beXCqiW/IWSl+rtLt2rlLFakJqwb5B60Og
         ld8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309572; x=1728914372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZA7sOYakjtLA5O1zDRt0AGiMrhjDOP7RuvFdqZmmnQ=;
        b=sqSQlJ5euhlUlE+D0DZvfhtNahGjg/ZRYS/PAJ7FmdC6FHIIQl//1MTLZHsY90hNIp
         ExnosqUsRFLgdhsll+TtOj34/h7cz+Fcv7JdXfF8Sg9S9zw2NbMj31t0heZou0QY695Q
         ENpFBoVwcVPAER0gfQabNM+R3RSqtp5s0/6dXal8xEigehXdgVglYc8FHpQN5WkSi919
         JTV4Vv7UEyV0fIneI6w2pYmh9OOC+QbRekm8iSLx/4m1OLKf3Qq7cpPKejaaCkCuILr1
         91taAGONLBmU3LO0wGtJ07c27EWFkyvozD/fsWZB5s7bNr8H9gEP2kn+dc9qMc0dy5O6
         YOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+lFIVH9HSCkVCMSVWp9cPPPSv7Vgzvse1V/s5CetkaIHp4G3T/fiZzlYw2xqL2gtqqPXFOIhd@vger.kernel.org, AJvYcCVE62XbBn2Qjtw/bdGqq1X+5111U9pf55bd/txF9qwJ/ww1SsaDGfMIhR5bop+S0HIrDiak+4Fjc8HDYA==@vger.kernel.org, AJvYcCWVjpdiQFQyckU7Fke42H3ktl6bC/lYg1gqTqohw/DlpDpUNI/QrmEwN3yzfTS+T52+MRbxRENRDAYXimk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuozi/ulGhqvKlHT5zGDnZYJLVqh3/TvwOUcOtQQV33TL6fmpZ
	V1eQbONHba3viKDtb2I9iAdtp0keiW/IF+47I8E4ToqQJwqbk5PXuESCPgW1
X-Google-Smtp-Source: AGHT+IFtrU90hO1foCtNOcdJ7UH+emPjbmgYZRb9io4Awmt2HRY1jCtk8wiNlNHP/UP0FxJKLgWMdw==
X-Received: by 2002:a05:6402:5386:b0:5c8:8381:c1f8 with SMTP id 4fb4d7f45d1cf-5c8d2e15074mr8657330a12.9.1728309572346;
        Mon, 07 Oct 2024 06:59:32 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb604sm3213582a12.71.2024.10.07.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:59:31 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: tee_bnxt: remove redundant assignment to variable nbytes
Date: Mon,  7 Oct 2024 14:59:30 +0100
Message-Id: <20241007135930.1198619-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable nbytes is being assigned a value that is never read, it is
being re-assigned a new value immediately afterwards. The assignment
is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index 40e3183a3d11..e0ea4ddb9a74 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -143,8 +143,6 @@ int tee_bnxt_copy_coredump(void *buf, u32 offset, u32 size)
 	prepare_args(TA_CMD_BNXT_COPY_COREDUMP, &arg, param);
 
 	while (rbytes)  {
-		nbytes = rbytes;
-
 		nbytes = min_t(u32, rbytes, param[0].u.memref.size);
 
 		/* Fill additional invoke cmd params */
-- 
2.39.5


