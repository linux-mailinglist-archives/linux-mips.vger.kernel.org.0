Return-Path: <linux-mips+bounces-12871-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951DD159E3
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BC53300A3D1
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB922C026A;
	Mon, 12 Jan 2026 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXrl20gr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kV/JJYGG"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C32BD587
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258141; cv=none; b=GowgTqMTGvAMbjZIPN8cHqc2KlzFnwvtpjayDYxYhZreCpTUH/m+kRpRPRu0kPGrdLpl2Hp3Y8vY3dN4dx2RmW8mrbXazWsqh9McLZaEdrheISdlWWYWdrdlPmX1BKUZQWpOIcptzY4SVcMbVLoRxmDfmeM99FwcSMnzcctMeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258141; c=relaxed/simple;
	bh=MIUnk1KZGIfpJD8Zky8hfgE81EmGkTsAz3elfN1SQx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uM3pakqqxLrnyt1W15kkAR9Hcp34lN19/ug4CYlAwn7RVw3bqJ+OEeyg6IljRevdmrX7kFmWLTHGsn0pOjG/GNFclokSr+Rg/dp84rh6UEgn2RM7Y0PYW1QKXCOs8PaO5uMn6L/Tbwoo0BQ2VsOAjO7w6h0gfZuBYJ4mP0LM1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXrl20gr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kV/JJYGG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QOY3413dzl99L/HcgZ3lTKVIgfySLRCl08A1MkY83n0=;
	b=VXrl20grLL8Z1L+LEdRnavSTyrVTn7uORYIRG7U0XjQz3LoTdw8W6aQ+X0lnCvQkxDr1G5
	Kb8h8qpamt9ilds6auyEiu1aCpfyYacehqcH27kM4QqFyqdifrRAYvV8nyPmonFnrTIL2C
	BmAKl03SPe3E6SN92iGWr/iciFxrPxU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-rhjTQNq4POW-Qd3W8IWnTA-1; Mon, 12 Jan 2026 17:48:52 -0500
X-MC-Unique: rhjTQNq4POW-Qd3W8IWnTA-1
X-Mimecast-MFC-AGG-ID: rhjTQNq4POW-Qd3W8IWnTA_1768258131
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1889446385a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258131; x=1768862931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOY3413dzl99L/HcgZ3lTKVIgfySLRCl08A1MkY83n0=;
        b=kV/JJYGGsvXs5U4E6kUxXJcvoBsbGq0xB70yl0KH2TmnByM73Fna28vh5jCmspEuEa
         PzDlm4Q4sIX19TNsKV9RmYtrx8EN8ujkpA+fTZMEG5rsCRAAXwKSCTJzd6nLrotjlc/K
         i/eGLL3prNHlTdzZICCPS4+UIzBghqmq6wc3HYOIurOVli18n34+5R3DOJV1fXP7Lpma
         5k2lN2Q5igMTIfLisf94Is68kLh0zbEwceCi9Uqv+vvIKzPI5UsR95gCS1hcMqul4D36
         iJ6JvXsJbax4OXTouCp/BUKq1uM4tfT/PsdaaIbJvch5GeBVb8IgmuefZVt+SllpeYU9
         L08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258131; x=1768862931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOY3413dzl99L/HcgZ3lTKVIgfySLRCl08A1MkY83n0=;
        b=j/gnM5RVxeMLW4HpIxN6v+P7bfFpXWUDzCbP7BkE71/hLndjWgjA6dQoQRmIjEDSNo
         YxjDqNfb/GEw6wc1VcJkUFoPgrwrfq7OcaMK1+WUWbfqwbxNSFscS42YbVgW0qb0kUCk
         Vs+QQY9i1GNhuA5cIbZ5XqajeIqDbDJ5sZdJbJbsiEYeAckta/dn8wxaE5HcnsVRqSwh
         cIR9Q/LLPEfo4jK0tJHudDPnwKZF6EJ4/cZcbgM9V9pcWMIWjW7db0JEHHhjevbhj1Jj
         cdFVLDJnAiAUqUF1xtByi6D/69vL/d10PXZiibI3yqMJQjoz723Xjz7B5t4CjBOsNGQU
         33vQ==
X-Gm-Message-State: AOJu0YzkLuyg5/dLPMazPiXQgCxDF/z3sn+Mc94UC6clI2Chq13NMjUl
	nyWnQSwc3RAnWzOkn++2/dBfWNy3qVu6b3cOWad6UTzmXIqFIVeiaZ812iSXK2eIHP0kOD2vYol
	0MmNsbN8DeWuEwa0cuU+glR9CkkKkGs6vtzx06qu/F9WG5hw4krFw2nI/iPjjdp0=
X-Gm-Gg: AY/fxX4rpVSto5WzxkrPBo3FQ4/+RdelS098IGaDneil6AmukY64nkocL/jjUvnIDsJ
	ptsJJAjZBWqkYwsH2Gj1Nf/00JZULNua/RZDCoy9wBZh/M/x01duOJu6G3jtAsvu7nXfmHzhmfn
	87GQLJuAv/aoRkWWXXUb310OyWxkCI9WB3D1ipUC9qfecgRDHbmNTa5agXanjDRcvq24rDCY+mU
	rnsuQzqb6loWe3XKqXCOzAgXqgc7ukN/Spx5COWo/WjMQH4pfZvYKyy8JfDAxOk3mA63fZMaWCU
	qKY3BmogvaF0YVMLoTMbuuipHuo6DGdBmhHOtD4bhCeEsUTdDm99LzEXp1uNWlJQJzA/EV4dK/g
	6MvrFpHizp6wlipyVo4L1lVt71QpO1/htAu5Ms/Vu7hGUHAft+w==
X-Received: by 2002:a05:620a:31a5:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c389384d24mr2856104085a.27.1768258131448;
        Mon, 12 Jan 2026 14:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBsVob4PKLPqnrp+s2HBNeHlRB5tT5tL5RFd8/0axxPhXysZqt3cOijqz4JLLXZRmzSuhrlw==
X-Received: by 2002:a05:620a:31a5:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8c389384d24mr2856103085a.27.1768258131119;
        Mon, 12 Jan 2026 14:48:51 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:50 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:47:57 -0500
Subject: [PATCH v2 03/16] MIPS: pic32: drop unused include linux/io.h from
 pic32.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-3-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=MIUnk1KZGIfpJD8Zky8hfgE81EmGkTsAz3elfN1SQx0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7x6vW+4PzN4Ifpg38pVvz83MxzZ8346u8SWjAsWq
 480cG7e11HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE3C4x/BViXu4fmn1/sarU
 y/fzbFq4RRc+miuV3vOVi6tkstb15hkM/2y+3eyyidiyqXjux3lbGuc9edZn5dEmv7vqnb/chgs
 ds7gA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The linux/io.h include is not used, so let's drop it from pic32.h.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/mach-pic32/pic32.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
index e71c92a7bfde1342be6ea89a4bdf1389aa463b38..660fa4178b3e4e30977c8c4126df4266150062ce 100644
--- a/arch/mips/include/asm/mach-pic32/pic32.h
+++ b/arch/mips/include/asm/mach-pic32/pic32.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_MACH_PIC32_H
 #define _ASM_MACH_PIC32_H
 
-#include <linux/io.h>
 #include <linux/types.h>
 
 /*

-- 
2.52.0


