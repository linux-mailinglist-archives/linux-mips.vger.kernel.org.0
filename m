Return-Path: <linux-mips+bounces-4151-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E992833A
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 09:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF10C28718F
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 07:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF3813A412;
	Fri,  5 Jul 2024 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="hed19GzU";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="aHya3fCO"
X-Original-To: linux-mips@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868491448C6
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166098; cv=none; b=BrmhontZ3NksbdbnmMpE7TFvRwnctumUnfC8nBmnMmPNNgNQtivSSRybVMFya/pjdVqJQbh7w2PJlXBzhQb62WbYlDOL25AhakIKuL6TC91gRwPCQk45l+3cQgLz2mOgi9XY+XzGRdN9ond/V3VC3Pf0gIADvTc7dMyGNtVuZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166098; c=relaxed/simple;
	bh=Zcn/Nzvief9hDSm9R3roNLbz8nhgsBIFBjts3uENqUA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t3d+ANyBhciDrLRJdhNzvS75fj6GZl/lL+KmoxsRjF8XaOXy6ad2wQ5VVHPMer1p/Vja6+zQuSH4H29e3mWm/Nb0IeigN3vFKEu4bM2aP9AbqCKHhfDmkxbs8ei4D7QfqKGiP1xtLu5lMV3QuZCncky5/45Ak9rF8Ty4LVRJZCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=hed19GzU; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=aHya3fCO; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1720165738;
	bh=Zcn/Nzvief9hDSm9R3roNLbz8nhgsBIFBjts3uENqUA=;
	h=From:To:Cc:Subject:Date:From;
	b=hed19GzUhUKmqfZsEZylBqRhJ61R0T8VA/vZaEAn39+PgKmzPpTt/Q8ppNVSwf3zC
	 yuvya6qAoZ5bhHyzVqV/RPkNCqEpkwfreUZ26SZAoBzhH+UJYtRTgxXG7s/yar9nNC
	 S6exc8Urhle9yL1cCd8JA+SOwhh/IED/xwNhYc+pyCcOYO9vBEm/xm5Iv6n7muX4NX
	 3vWNpi6XhauFuCqFVvy7diFcuFFeswWNnOMgCw0Cys6rYuNuNkM5pcR2WXgWT5E/US
	 LJqD/9CpN3Fo5q/AcEZvbavN9W/1StMnAw58nJJX9Gxk8CjOACVl1gx5qWAtfGU9y6
	 rneHXoaeiGuKg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 30954971
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 16:48:58 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=aHya3fCO;
	dkim-atps=neutral
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id AD9EB837
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 16:48:57 +0900 (JST)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5c413717bd4so1188098eaf.1
        for <linux-mips@vger.kernel.org>; Fri, 05 Jul 2024 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1720165736; x=1720770536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MxuoJkWGHRJwetZg4ul9+B1wriVthDVUa7T5nkwMGhI=;
        b=aHya3fCOHJI770GjykCWs3NGOQhbV6OVCG+XD+ltz//zbtAqenNHqU21GkTzSuHoNc
         E7auSQeXZ5FQ5ENb6asThYNJKWjDE2a5fusO228w5HaK+YRt2NHTqRECuFktUhIr3+ew
         sV6bzCxwU1Sxye47uzyAlpt3BgDYs0pLr7BhbgG6iZOxrdnXFYAj28ncYitUyODxwjbS
         mpeiEmpTditD9fe8tqkNeW4zNpYNgGUIOkP9jOmlm9isA4CX2VZeqSi5hKXYODYkTh1Y
         358TJm7ZAoWMCTYnpnXB9IN9Zyv7vyR8o9IO3CjR2oQREj0/RydbcRDlj2NKJVhh9u0B
         JJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165736; x=1720770536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxuoJkWGHRJwetZg4ul9+B1wriVthDVUa7T5nkwMGhI=;
        b=p9dRNOHUXvhu+BdD9ZNReVtn1iSLkO42t8q8cINUE6NN4AyS5eyqAqkbfcErh43VBo
         Ph0NoLAV+x+oa7ePbA1g9B3bs1h3x6DJuFbMSK9dfKgedF5z3WjfvUfyj/t46bVawP/B
         7YeTDmNgjO2mi6ELqM5NmRPadhFbMqIKCsRtUVmpbctST1tN06P/De8GIIPABaZfD2wH
         rZ2fJF0GIyRCrgfZwWgnhE3u3rWj0L3wvrq8t/m0RWrkedqC6eaxB5Onz6Bbvv4Uc3jJ
         uDUV1wCo4ud2LAuuMbqmXsVmx2v8tPqPX8z95eY4vIMTU+DL7rFeFwuolNU2XwfB6437
         CtgA==
X-Forwarded-Encrypted: i=1; AJvYcCUCVbzs87WjGtFp/HXllMmoh8Unfkla5XAfO/DMD4JJ6TyKq8xiilmLjH9FwqN5iGXKqRVcJadWff/dlA3VY6xXUdOULQ96mK9F6Q==
X-Gm-Message-State: AOJu0Yz8sXndKIX4vOX6WgE2tGb0gzOUhADhQ2zBETm5lu5URH7iw4xY
	LVj0psRdfmNJmfq3Tm8dpeHQ4PEu/j9o84SVptcZss0gQOLuwFkKNQnqU9h49hHe4m5CqIVpjUS
	lVB3Nuhly+zxMXShDDo3WMZtVtvCiMCtCVqAFfNSgibg6tp+XSfSwRTu9+2w3
X-Received: by 2002:a05:6358:88b:b0:1a6:3016:1ed1 with SMTP id e5c5f4694b2df-1aa98c91efbmr363980155d.27.1720165736374;
        Fri, 05 Jul 2024 00:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE5s3uc9pyQVZG0Iv0PjBELyaYmcSwHMDmZ7dZ7QPbAPFWUW3qf344zw9phzABBwv0qcny/w==
X-Received: by 2002:a05:6358:88b:b0:1a6:3016:1ed1 with SMTP id e5c5f4694b2df-1aa98c91efbmr363978955d.27.1720165736013;
        Fri, 05 Jul 2024 00:48:56 -0700 (PDT)
Received: from pc-0182.atmarktech (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d400fadsm10578206a12.91.2024.07.05.00.48.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2024 00:48:55 -0700 (PDT)
Received: from [::1] (helo=pc-0182.atmark.tech)
	by pc-0182.atmarktech with esmtp (Exim 4.96)
	(envelope-from <dominique.martinet@atmark-techno.com>)
	id 1sPdgc-00FBmu-02;
	Fri, 05 Jul 2024 16:48:54 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Songyang Li <leesongyang@outlook.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Octeron: remove source file executable bit
Date: Fri,  5 Jul 2024 16:48:30 +0900
Message-Id: <20240705074831.3620158-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This does not matter the least, but there is no other .[ch] file in the
repo that is executable, so clean this up.

Fixes: 29b83a64df3b ("MIPS: Octeon: Add PCIe link status check")
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
(Noticed this when reviewing the latest stable release, as the mode
change line stood out in my viewer)

 arch/mips/pci/pcie-octeon.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 arch/mips/pci/pcie-octeon.c

diff --git a/arch/mips/pci/pcie-octeon.c b/arch/mips/pci/pcie-octeon.c
old mode 100755
new mode 100644
-- 
2.39.2



