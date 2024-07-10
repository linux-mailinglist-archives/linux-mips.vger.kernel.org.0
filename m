Return-Path: <linux-mips+bounces-4245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF792CCC5
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 10:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD4DDB23C01
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 08:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB3D86250;
	Wed, 10 Jul 2024 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cfw7Gvys"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0069CD535
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599652; cv=none; b=LusbBlzslgkKFY+Ysbh4wzGVmRXowmU1YvPEx3u9Y1+d6HhWqQwancDez9EeSYJqcR98ll1rBVicOoymb2aX8dl3JoawFiO9gvsmh+mf6NVczSG/ygE5F9M/b1sSLXmNIHci11mIz8L435t7Fz5c2wDRLd6U2eFrwRPZ5QJCAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599652; c=relaxed/simple;
	bh=Je+DDEL0VG5/HOJTUCWPS+iS7ACCfjrKKm0Py8oNDUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBgEqNsZoalZ+Vkzo2ZLMW/QEUZ7afLzyPREoquRhFCPE035sAiQcvy4FOlq2dfVWGPsvqwGzWt2B/7x/aPwzRoUh4IrrDNnjF2J8LYHFFOWZgIB5DohZ3UD02jKHCiAZ4o8hAT7/+5Ub6j0wm8QlheO0CRpWmjiMSafNr4ESkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cfw7Gvys; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so16597805e9.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720599648; x=1721204448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/fps9xeeLcadyxt/ePU2yFN+BHi7qw/s7VlkwnIe8E=;
        b=Cfw7GvysuHVPKtCCzATWNqNUHSerAMeJ6+mlJqe6Jz9z/mCDXnfyaPKrjVm7e3w9hh
         eZ0uTWabfrLeLbBMmi4i27CGWYdmkIM2FlsSf/SeyqGCfBn0eyiafpM7xsFVRcyerVEh
         EB7T4SzmJUoDLHYXsQJH9d4ezLRx5B3wnY0siGIwkitVSpq92y9qX7LBphdwObEWPotn
         6280S6n2Wh9PY1JnEX+a1woQxTKrFflZ690xbXX0I7GtEPeeGY/A7fFt1oDpknviDiHH
         j+BsuG1dFdcSq0926Gqr5Btc3Eg5WrKOIldNsx15mH3uzKbD2/gQxUBMCcAar6ZxUV2v
         c1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720599648; x=1721204448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/fps9xeeLcadyxt/ePU2yFN+BHi7qw/s7VlkwnIe8E=;
        b=r6kzCaT9oVNYhSgacY+FnMawpc79Vvpeua/5qINFD8AM20K9KEnLA9y2FPiAcV1U+5
         SsFovK20TVlL+saZtHHCjgJGtLL3UVH5VYDAAWJZnn6ulWUAC7V/lpd7TEEtfwsqXqdy
         GpLdHB+NeZv8hjRq1WtalFlp1iH3Nt23psuy8OQLK3/eQeNGXo3M447yH8AYg3RU6cpI
         IZ/8h30mQ9IOhD3tFspjTfbJCyizXGU/lZxQJbepAhl9HVmUkAVZHDHLXjyfBWUrJpnh
         u+A5igB4I27uKl/XnPE1orU/wQjzplq4tgsTmJLA5qyJcUV3dwiJ4d4ygN2mAQIvPphb
         vxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl9JtgrJU5EKXFdf8NLxIo2FCDz9d/r/6c8cVk6TEXM06pllFOLKULW3LRWeJQdlXMhwcmEBAIASVpjHyUbZW3XCEodR3nBNo+0Q==
X-Gm-Message-State: AOJu0YxzEMsfVyPE2RhfvZXBui3wiJYp0tX2W9ghCCYgyT+m75SdUGxZ
	oHFzlYfsgGyvuxTT7z2zIIfDSNcmhEEM424nIMtwxT7l7LCOQXpXjYmkJhC35t4=
X-Google-Smtp-Source: AGHT+IGNEmgQqVrXMH6GciGHOfhLlylIQOsKl1v5RdniUOzNY9s/KvFekBc78QGlsR1LyqnjL5Ma0g==
X-Received: by 2002:a05:600c:2e52:b0:426:6a84:208f with SMTP id 5b1f17b1804b1-426705cf5f9mr31980795e9.7.1720599648356;
        Wed, 10 Jul 2024 01:20:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6932:abde:fac8:217d? ([2a05:6e02:1041:c10:6932:abde:fac8:217d])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266d0185d9sm95900845e9.3.2024.07.10.01.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 01:20:47 -0700 (PDT)
Message-ID: <db16f1e1-f874-4630-b8c2-3778441fe569@linaro.org>
Date: Wed, 10 Jul 2024 10:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] dt-bindings: timer: Add schema for
 realtek,otto-timer
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, paulburton@kernel.org, peterz@infradead.org,
 mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
 <20240710043524.1535151-6-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240710043524.1535151-6-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2024 06:35, Chris Packham wrote:
> Add the devicetree schema for the realtek,otto-timer present on a number
> of Realtek SoCs.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


