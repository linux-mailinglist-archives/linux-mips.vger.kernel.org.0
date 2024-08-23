Return-Path: <linux-mips+bounces-5042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5595CC00
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 14:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4957E28290C
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 12:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97F7184559;
	Fri, 23 Aug 2024 12:05:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5631E184552;
	Fri, 23 Aug 2024 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414758; cv=none; b=CMXMVdS/1raL14/nnxte4RffLslsDJk5vXO/mbUZcnCyG7IjiQwyBlhg11uo0YoWqVmVsD3SO2CEYD7RfFrF+IcVJSj5u/F9UbdYykN9c6kH/l8FZXzTL/nzW0HNJiaE2VnoxsR/42ApG1Ehs0GKVPh/YfHfxyWZZ5GLlshz55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414758; c=relaxed/simple;
	bh=DR7bqGR51LfqIMAQgP/pa0BHPRZM7nHCDVY2zJ8WToM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VIyUOKCXDBg2o0up+Ek3VtOIhl6iZmupPqvMYJD17IaqYXKJOot0hIQJLJ3x2J1Ttu1mW0XA4zp80jRY7yGFNH0ljrRc2OgmKpaivatfOz2MoysPFD3vS8bwh5Ih/OhH6BtorYU4HS0N5LeAJyaPN7ZAftEXM2fVIQRTL/AICsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-454b12cc82cso9463351cf.1;
        Fri, 23 Aug 2024 05:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414756; x=1725019556;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGZF0AvlZej7rqgff9jJof3mfOBatM8jwICNkXKrrqk=;
        b=dOK1dnzo3i8dd1mX9cSovapqR/SGucbBybKpwshUtFXtjLPaW+Ityu3wv/jpnAAf+N
         KvFtlpE+sSQLzNoqDNftJ0q5/zXtpj7c/s8HCFJUooXE/azZIZeVi6ZZPP/JD9NQe7xm
         DUgu5HN7YnexKv6GebBtCZQ8bVlwv+jT0N2AVGE48KhmnJ5SkGcokvfH5WS8ht2gZ7q3
         +uYz/thaK722fHH44uiEaxoPULtJsn08/pITWNAz8iHzPBNhxgat9qelG7e8v3qCH3hv
         VBZtb9LeeJXeU6f3XasGBNl5OIHUx5/1LTqOZj2ZfTDHZdwMC4ZpISDKTz+GpcyUkq8J
         LWBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF+QZwcdCwdgU5I2FvdKBWXmrhPQ1Zt+0jJmhU2pjMXP1pThHgmb0KudS2dA+gddajbdi2G9IFZ0QK@vger.kernel.org, AJvYcCWoRZcVl43wqeetmle3VyFDjk8dVKv7HPAmwvcNRj13hkNu9WZeZlCr4d99Jla6aWBWy/ZxoAWfaHs=@vger.kernel.org, AJvYcCX+oRdBMj79vR5MSrHXAMpjfVxaPXO4F+/50dwjYT6J1XodbdXWORWYG8tpmcnRJlgl/r5q16HTEMcQtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYtRk5smUnt5ZJqkWsdvVyx5BJ1K9DsZTYOsItttvBZYnMY51h
	6G5ApEfhrqXZJ3QrkfoSdlJYVakReEBUUEgcgbIUMALkRzpgThPTVAETYjWJ+WY=
X-Google-Smtp-Source: AGHT+IHUiEQ2UHjFnBpHefvI6CBVfER5s973r4J8f4wJcBtlNN4Eyl+cyb4eanEq6/83M/3CpkPpMA==
X-Received: by 2002:a05:622a:1f06:b0:447:f41a:aac5 with SMTP id d75a77b69052e-4550964738amr23293121cf.25.1724414756229;
        Fri, 23 Aug 2024 05:05:56 -0700 (PDT)
Received: from [192.168.2.219] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe196d10sm16584871cf.71.2024.08.23.05.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:05:54 -0700 (PDT)
Message-ID: <e7629e1e-ab41-4400-85c4-e3b39cf5be2f@vasilevsky.ca>
Date: Fri, 23 Aug 2024 08:05:43 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
From: Dave Vasilevsky <dave@vasilevsky.ca>
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
 <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Content-Language: en-US
In-Reply-To: <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-23 07:58, Dave Vasilevsky wrote:
> On 2024-08-23 03:16, John Paul Adrian Glaubitz wrote:
>> It should be disabled on m68k and sh by default as well.
> 
> Sure, I can change that. What's the reasoning, so I can explain in my commit message?

Oh I don't think m68k even has ARCH_SUPPORTS_CRASH_DUMP, so it will always be off. My question still stands for sh though.

-Dave 

