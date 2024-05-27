Return-Path: <linux-mips+bounces-3331-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9C8D0015
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31F35284AB2
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF57B15E5A9;
	Mon, 27 May 2024 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzdbb6fq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3B15DBCA
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813189; cv=none; b=Q9egfA2DQu/SkPzqHis9JMPgchm35AE77bl8LGL3H6dWTm7FbTKfld0k6mhYY4h3BQGz5oltOTAa2V76HWW9KR7nGYcICkiYDJlpaCaO+XpGOssRMLcr4M5eqsyhBYJOVgWv8tiAN3WG2DQG5BqDiqpwCVKnoan0twYJGhpaJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813189; c=relaxed/simple;
	bh=6gpy4QnlXfn+3VfnJIdKkS3eQTcH5CkCvAbl/LBAL7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rubrhJ4vLZSSJ3ypBHrTXuaqMq6sc+nRWn/iJEkTGZlNH9RRoTaporveCo/kZNNnsLdfJJkKSLmGbs/KfIo6z5tNAIfYjRmZ6t2NAkF2KyPcQz1z4P4C2iWkVHol+L8o7/Cs+zjfUXj+nho09rdG8lnAwSV8xUG/mZ3zs4jJh9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzdbb6fq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-354e22bc14bso4463775f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813186; x=1717417986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PbKr6F4qyJEGh68m1meo5rRQR6WxkeJ7FMZXKENRV0=;
        b=xzdbb6fq0LJntuZkZBwLuTISb20CAGSt8MJhSIqpmOu0fbKFrJBjur2YzKCkG/3zlF
         BieO76tfiki5EqA4MN6au6YEbknU+cWfL5ElLfvjUsfgWmSndXJn3IjbWeH0FTxTXto1
         6b/j3y7CSxSspyexMO3FV8dqakGw6w8kN5MUjDSSSZJaF8+JppoAeYKklOjZVq+xqk/b
         sLoKvZqjE9pf4cwpxEkwrFiqm6B/dEjLB1O/EcDzO3sunHSD7gISnWUIWaUphIkNZYK1
         oOl7tpzlZxe2iuoNgrvVeNLiTyHlyu/HMZy/beD6Vm1ssbxsd1ZPHSKqhoUTSM7I1T0L
         ciCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813186; x=1717417986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PbKr6F4qyJEGh68m1meo5rRQR6WxkeJ7FMZXKENRV0=;
        b=m1iyCbQGOpQuy8VFmXFhbxMjWGdxBB7SgK3M0xXflEGP9KwBD/3hY+nJRK6sqQTtQg
         vVCEEQ8bp7NUakCfchgbalttqbCKeop2/RczJokfyR0zbBvESSsU/DirJOpQ6IIMS+Sg
         3D93F0cNjvSzwU1zgvda29sARG6o0dZ8nU9gpQMeENY8aOiVzg+9wRg5raJO4Y7HKTx2
         qn3wIZ+UYX0KqdQxBSLQMWJYiAuagGUu/3q1Y1ebPpl267FxbB/CZfeq4GFbZjto6vOP
         PfyX3yAN0FeIVh5amNGpFKpaEnZ7kIfpLfx63Y3Djkd3m5LpG7Z9nfgyNAg/FEiWK+hN
         /fWg==
X-Gm-Message-State: AOJu0YzK185Wl3MH9QFbW2/fmHLxIA7Mg8bjDMyrHVSkOrcNRDFH/Vid
	ppOQp4P0ijGgYxOdksVa3+2NRqrrSreFCvJbl/VK081PxsmGGwujRKKd5BujpYE=
X-Google-Smtp-Source: AGHT+IF3YzofNuY7fs0Qc1CTGRPqO/DtJKUbJFULuqF8piYQueCYqw+R3VAn7929Wkj5lhKwclJHmw==
X-Received: by 2002:adf:eccf:0:b0:349:eb59:c188 with SMTP id ffacd0b85a97d-35526d67290mr6935711f8f.5.1716813186518;
        Mon, 27 May 2024 05:33:06 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a08cc1bsm9025986f8f.45.2024.05.27.05.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:33:06 -0700 (PDT)
Message-ID: <bcca84a0-f12b-490c-a61f-b10a9fa0395d@linaro.org>
Date: Mon, 27 May 2024 14:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] MIPS: Loongson64: Include bootinfo.h in dma.c
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240507-loongson64-warnings-v1-0-2cad88344e9e@flygoat.com>
 <20240507-loongson64-warnings-v1-2-2cad88344e9e@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240507-loongson64-warnings-v1-2-2cad88344e9e@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/24 20:51, Jiaxun Yang wrote:
> dma.c defined function plat_swiotlb_setup, which is declared in
> bootinfo.h.
> 
> Fixes warning:
> arch/mips/loongson64/dma.c:25:13: warning: no previous prototype for ‘plat_swiotlb_setup’ [-Wmissing-prototypes]
>     25 | void __init plat_swiotlb_setup(void)
>        |             ^~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/loongson64/dma.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


