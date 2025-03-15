Return-Path: <linux-mips+bounces-8206-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB835A62E87
	for <lists+linux-mips@lfdr.de>; Sat, 15 Mar 2025 15:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07579189ABF6
	for <lists+linux-mips@lfdr.de>; Sat, 15 Mar 2025 14:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E501FF1A0;
	Sat, 15 Mar 2025 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmSjBQ9i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDC1FFC55
	for <linux-mips@vger.kernel.org>; Sat, 15 Mar 2025 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050546; cv=none; b=MHVlFBlUPgyyLd7zf36iaF92vCVbuLm6w63Ope+DSJR580z0tv3Q4AEqTfQsGRQJLKVjQRaWhkq+yV6S9ZMZ8udWSeU61hFzegAgGQvSgdOlDzYgLe7C93ESGsgBFKrzgMS4ZeF5UNAlYgcBdI7CcjAJJzq6B2FMfgR1ww4eLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050546; c=relaxed/simple;
	bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=W3LsdxnlrXtD7ZnwiiOKpyCiFYgvsfCCi4trWkAxj+09oEr5ags4+ysXS/FvIOYTKF+8LWzjWoRmLn98t9mGD93KHqEG3mI5ckVgDS3Shxs7Hz4kcGykV8Fa3QvQVMqt5/kopTcVrpKjKibNczoTqxc1YeBBpgxVtI3JgI2YZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmSjBQ9i; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225a28a511eso51410815ad.1
        for <linux-mips@vger.kernel.org>; Sat, 15 Mar 2025 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=vger.kernel.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=PmSjBQ9iXnLJUW2idUj4k2rryQQVbg/u4JfQq9Z7sOLQAWkwBeOXLDdObkRKX/YwA5
         VZKXGNshnwN3FzHVih5sE5LsjfahwEYo8mTxY+LFfphTknebNzB/lfuO8AgeHLHwztzw
         hsQclR4CmM2Swg9TQqh+7yBxVTAaMFPsWwwstd/omtTWD9gRwkFkiw3zLoYoHumY5V1+
         OGK3MYKiA74blXWHYoH8LmYf767Z13BBpm0aBv2/F0xio5h/xsfr2n+3+iVpbq4gm1iX
         bEVfjWwVFbRAM9csDsJGmDcIdCcvalQvxWekpf6eq4XRcvLFvrtmew58O7LnVVFdwxXC
         yFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=E7OLQvBsYjYif6QqnAiflpBr+kaHHnTTokP7jsCVneicmuH4J11DqVMFSLTlyJx61i
         hWhxsFk/vNgBXqQ8+cM9fK6q1hYY9ShYoReNEa7Fgx92mK8Sb9ThATcVXcmBsq/TRRsn
         WJT4a87DxjL+wbpee7kzJjZMFfmsYxnPcxwTli42Lo2quDjDgeJBErisnsNDXiUVzbXC
         OPeasez70chPYAFCCGaE6B8OCdaAt8u/KzTJvjpOioSvqr1yuGHe5NH/K6EUqOk/myz7
         SYDCjVVcHf6bYWU/dNUgtIj+NjIxB2yLsBfw1fM6KaNO+CnDz/s57GnLPxiMtVQ8H+Lx
         YVCg==
X-Forwarded-Encrypted: i=1; AJvYcCWDBVwgXcjC9IxP2rxGDLJ802D34WrswKVVFFTdE36xSrIHm4AG1YXwkeMcQJ9hCVsKBjUatup6R4tc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzig9jOy6f6B9pURHoM5f/I7B8nS54JPsalmKGU+cuMv02snsic
	wURsM4cUHbOzbCG2elO/04BWNUCUnNLiR4vX2HwzQzAxOVpw/Ptc1d6gzUU9ntUgaW/SMkTLeO3
	Gt0kceE2lg0ob8vkXlXeeGFz+V7GAn+Kr
X-Gm-Gg: ASbGncvoO8h/yUjcWlWASv+95xVBzejOZCqrI43ToI8do5tD81S/N4NJnZ3ny8g/Vnf
	MTAStjAnHn22eQ39sRexAH3vLm401K8I68gr+vDjtRKhRkHM6hHoxs2OWpN6+VDpvYW/0KcRPRZ
	qHNaZ/virTetM9EyOH0E9aNWc=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920213a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.

