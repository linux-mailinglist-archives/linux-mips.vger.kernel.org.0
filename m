Return-Path: <linux-mips+bounces-12253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5600C5F040
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 20:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F4344E4BAF
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 19:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF732ED84C;
	Fri, 14 Nov 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDv/yGil"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4C2ED168
	for <linux-mips@vger.kernel.org>; Fri, 14 Nov 2025 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147652; cv=none; b=RQus/odMg1V8jkIegP8b5lJ0rxpL1ZHTLcKoQ/Q4n+mda/TWonvBfRRD3LfGl0Q+id8ghZUV4yGFdOcuk/CPBi//OtDBwh7GUfd/gykyxJDIekdUztqWFRaZoT6A9Qhoz5Z8M0PNGX9NL76Kp3Q4lGFE8DvUkaimaRNXvh0gb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147652; c=relaxed/simple;
	bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUIxTULzwIRZAi3CsJ4DzACihnWHzkN6kTS2RM2mfZ3lcH+mqo7UaSuQmIu1m8pSKO0wuiHdtgI7ddhb0wo5WqROISa7FXtLPbqd1P5uUopf7o6ET2seD/AX9ukA3oOpgyjE9dqgraNZWWCdqEnwtwm4gC0WzzkvGN66zBYzcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDv/yGil; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso3510049a12.3
        for <linux-mips@vger.kernel.org>; Fri, 14 Nov 2025 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763147647; x=1763752447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=mDv/yGilxm1t28vSlrre/2ltqEgfZcjvcB4hu8QNA/8xV80FIFn/c0aNSUre4ryXEq
         CvvXFpucKzKj215etP67wAyZfJIiaYsh35yDVgi1XAeciX6KncBmSiBNzODol0dTCixP
         +vzj6Nc7sfceoJqLdFjj+Tevf5kVtCW0G9cphFgQ8D5XIW+PW2HAEOXf7ZamiFGxWQlf
         jop4KKWm3xTg5IQWmFjy7wZqiLcEXpmSjJi1szpCLzVkmN0bm/TyXmpDQb+bkCMYbggB
         R6ZfxFXONOZC7zLWDJzwAmGpi7URO5Lv/Ld7FF9ZmMyFQQfLBzPpQhORyMrW/dsAqojt
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147647; x=1763752447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI9onR+f63JFzaNIBKoGx3OAwegzLui4sLBarF2xej0=;
        b=KZlAJoz0A0DDX7sXwo59fcXr8772GmTfVDl969/pmw4sCsxaBOqgGOGZHThDJRQnrm
         F9IqqlmHyGwhh1tytLw1ex4GC0ctq3f8xFCYg06Mr6+eHa+8E7inDKyIY7uZATUZEi1m
         och85/pzq1Ast92QAj10PCVXGOCf32xK5RUdyzlO/zIoZ6OTwRWFEma/2ghjKnBJd2Wl
         zgFXkqIrLjjMLtLSxNwq4fTVEa7ZfIb6Z1/r6u8qXDFJK/EG9KjmaIvedNr4tte0jFJp
         U3bLB+0mXbvef6bvXjlLhN7Wygm1ZVg686rtZ78+uYNozf/9K2uFyX4RR630o9v0kWwi
         9p1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsqg5XIixo8qUbOA97NFX2w5giNddDZo+Jut2eM30dvUmRJbEdRxZqgWDilafmIY+vUj2cHVfg/0rT@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCEPuRkOHlELlSz6h4KSUvAymrLFp+Sv6ekUoB15tsWIUAXZh
	r5BfdGrmsvBnyhfTUhxODPrCGeH6x5ltUBc5YTfBNDU0Grb9SEyyYO0ZWqnnw53FW5r5xBDYc7O
	9UhP2fl+8waQAzhuUj6bIlMNFqodpc9g=
X-Gm-Gg: ASbGncvVgpBI2ari7nem0a+L8Lwcxq21RTfvmLAODo9glIYMlAMT487id3BIOh3koGV
	iqLUj16Gkx97kUPRuoHs0yze2hvyRrmWTD/Y42N45eC/pafy6BrFPLZqCr9yQsbxWnx2bBZvYS+
	//Hw7aJBcO4FdQsXOvgYPaG5VbD2t6aRVc4gQeH3NVILGaxm9JgfZWObDxZkBmg2VRa7SL6FrAz
	tgb/7LoLAe62WaFEuvtqJxtvVWHFHbyieKpMhy7GHMNTlUtMslshY12OubwUA==
X-Google-Smtp-Source: AGHT+IEvBu7ESLrGNRMv2QiwL16IZgt6aUNJ72TYzx+vz9COzg0vAhK2L9oI/n3nL6QJ1JU+lRhqexZnJfrgTYt3DEI=
X-Received: by 2002:a05:6402:4603:b0:640:f974:7629 with SMTP id
 4fb4d7f45d1cf-64350e225e0mr3893696a12.15.1763147647239; Fri, 14 Nov 2025
 11:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763117269.git.zhengqi.arch@bytedance.com> <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <66cd5b21aecc3281318b66a3a4aae078c4b9d37b.1763117269.git.zhengqi.arch@bytedance.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 14 Nov 2025 20:13:55 +0100
X-Gm-Features: AWmQ_blqeEJIFeEqLe5Vq5SGpFC4UPadwiIAm270RAB9lR4JL9-RyEZ3PVaRM7w
Message-ID: <CA+=Fv5SGu_Y-zwryrQiTQDy32SipMk_dfjZezth1=aZmnDKNeA@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Qi Zheng <qi.zheng@linux.dev>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, 
	peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org, 
	david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I applied your patches to a fresh pull of torvalds/linux.git repo but was unable
to build the kernel (on Alpha) with this patch applied.

I made the following changes in order to get it to build on Alpha:

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..6761b0c282bf 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/hugetlb.h>
-#include <asm-generic/tlb.h>
 #include <asm/pgalloc.h>
+#include <asm/tlb.h>

 #include "internal.h"


/Magnus

