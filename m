Return-Path: <linux-mips+bounces-5041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD295CBD6
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 13:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4810D1C23FDA
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BFE187FEA;
	Fri, 23 Aug 2024 11:59:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485F187855;
	Fri, 23 Aug 2024 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414340; cv=none; b=koBDVGpNBDRL25b7TECmwJwaf/Y1GyA1kVRmz93Ztst3YNbbSseD1cE411P+LZ1Ua71x14dtW1JUyPIJAv+Y2KD8Rs92f532OY6jVI0gIRgYRJ/vLpECUhrQ7MKcy4fpTYQrTtWGBbTWc7CC8i0IKS+qeRSWMbR5Y0gj9F0aGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414340; c=relaxed/simple;
	bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD/lomHc4ut3HQx61kb0r2XQ1j2LYW80t0TkZ0BxOIXn3zGG21RGk67X4GPYE55E6jizFF7Fsu1IoPw73fcdQMUYb87WGBgC4TSTRhZ88MrZ/jGTyMqKq3MkSDaiMF60nwM2p1xlGRkVz3lWjxGDJsAfdJwBkoastnsYozMcwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-498eb25d247so523084137.0;
        Fri, 23 Aug 2024 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414338; x=1725019138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
        b=Z7d1PcC0hyJx7t/9khltLLMhy8kFmFym8X2qMYTEiAPn0oblFZnv1/S3YJgYfMh2qQ
         gPXMQXz3JmGCf5M5k+QS6uC1ypat7eXW2qM95Ws2aGCuW6zYYLcBa7zJCGvAYBPl0Nt1
         DJVh4JLYs6WSuslGGhhmGhr+0nG8oKxX+4d32N9HaHZodo2WQfL8nYaFVM7m494AddSz
         3cHqKkVgVpyOwxTcMa0bcJc8palb270mnhM8GuXRhHgbJzlOdtBTAghPqcqYyZ6LdlQz
         vwnpPwX+u5MQEECMYROXXkp8KeZthvHJBEgju/NGyTQiIDtVj4NmbWA5HbBpuTKHecBl
         ph5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeGJmthOc5YLbNnq0tgxT+aFq2XOEMC5VVfTpsytxDxyka37JCZ9FcWQkN9g05W/+/y9KrYguOKZLU5g==@vger.kernel.org, AJvYcCWQRv4/tLmXVI9qCtGo773nQu3fSTVLfpipUt9dIae6bZmBbT6O13vHSgxgwqXqdqGV9PcK/n63mv0=@vger.kernel.org, AJvYcCXmWa9fnngxDnmoB/f+gJNzRxakMuXOJrPTCyNlr+C6cRE5HzK8JMae956BfvGPJna7RI5u+1ZjvvaB@vger.kernel.org
X-Gm-Message-State: AOJu0YzmejWAReZbdTomZWnQl/Qn79pgU1dDDUZdiSor1XTXvS7ycbuf
	GMAZvstZcYA/UgieO3Z/x1vSY82uDprrfHZipZcWFGqMkFqKXsJv
X-Google-Smtp-Source: AGHT+IGTnsj+vzaB6DUYSRe4ILJB8y8mubsJfwnJ5TjC90dt1P9FzBdqUNam7n18s/aSRrNdBhBpzA==
X-Received: by 2002:a05:6102:26ca:b0:48f:40c1:3cd0 with SMTP id ada2fe7eead31-498f4633bafmr2258426137.12.1724414338017;
        Fri, 23 Aug 2024 04:58:58 -0700 (PDT)
Received: from [192.168.2.219] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d6db58sm17621556d6.65.2024.08.23.04.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:58:57 -0700 (PDT)
Message-ID: <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Date: Fri, 23 Aug 2024 07:58:44 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
 <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
 <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-23 03:16, John Paul Adrian Glaubitz wrote:
> It should be disabled on m68k and sh by default as well.

Sure, I can change that. What's the reasoning, so I can explain in my commit message?

-Dave

