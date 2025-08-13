Return-Path: <linux-mips+bounces-10250-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9051FB2477A
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 12:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97AD73B4F2A
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 10:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1078B2F49F8;
	Wed, 13 Aug 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dzqowq6t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D62F5301
	for <linux-mips@vger.kernel.org>; Wed, 13 Aug 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081406; cv=none; b=owlr4qeBtirgXtFZhHVnNz5S7ttbPimNc+VrvH+j5wXJCq4Wcoph2hmd+oVXVbquCQDUprJRnSk10YA0iSrJDcn2nrRU/Vec5PbIg+af7Yi6m5xMpV82sbvjKy44A3/yY5xeMMH+q3xbU6c1t5F4Nf+DZombQrHYzfL+c7vPI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081406; c=relaxed/simple;
	bh=Q1NhbFtp2McdwP1oX5NSBNJM1rtYXPpcXrqt1U91T0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NQIS45g/MD5dcRvrQEurtcHbPX0HiIEuIGLywQGFlHNHBp53tK+YKTrK3rHaGjV5gOL1H/qvQfcZmdwwZD7g0SwoUXdYIDR9XmDJrqzaoCxXFSidqvdGp5ZWYfJgE65VAXfwLFgyiDOp1p5FhRC1O707EsyssV9Y5EVynxHnxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dzqowq6t; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6183b1541d0so445348a12.1
        for <linux-mips@vger.kernel.org>; Wed, 13 Aug 2025 03:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081402; x=1755686202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F86Ss5ZDMwE+bMtUpttaC71xy+/6MJqMSZw67R4Rmc=;
        b=Dzqowq6tm6k3VCdEkX2dE2Wd86TvSaNTyZ7UN+AaDziYmisppYm+C+mVURFnYNOnOy
         ZZPsaZr2ZbI5Z6inqjIcZxgeqp6mMmJvvyAazOoSUDYZNb+Bq4pcB2Z+n4irh+5A47tZ
         xaCk8vMtzqtPX69ukPvY+bt/HYpkQDmOoJsCvebftxiUGhdzUx2YHlnbF7Qeh/Xy1gUF
         2/8+MtZtEmUewkeUKGPhjAkG7ATHKRd1AHcqCtDpNV08x+HSr79Tx08uF1mUhmNeMQmn
         v3wzswax7TQQLoEsD4ZJebkzFvoo7M6Hi8aZtj5z29zUKynz6ZLLZKPIGSZS5+ZCGwqq
         6ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081402; x=1755686202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F86Ss5ZDMwE+bMtUpttaC71xy+/6MJqMSZw67R4Rmc=;
        b=q1C29d4+mz0uD0vElOxOODoTh10uGWc3LFhgp8u1HztB2Rs0si2hCrYTGuEShuEixI
         cw6TVG9V8q7IowFDElO0ANDblo5DnwwlpBXebUPd4Ytb0CsNoFO8W8UgLA6R7+mM468R
         HG3lAgeaxp7DIOxfZAU+EwaWhDMvpgVxiO9pXqiAiAlAMfjHGKx78EP5Hzr29dt96vNn
         OlPlgagsEILtpHs3w3y0AGa1+XvBkISCY8J4yuolktPqwQJ03UW2wTfNg1g0vGmeeSEj
         83yViWpHOEGgkIw6lBF+k0d0Cu5C4e0zuQEQ+CXJ/CiwF/XngBFRpc8sINQY4vyBh+kJ
         FkRg==
X-Gm-Message-State: AOJu0YzNy2ssZsyQfleliyxALTmOhfSC78VVd+Vn+raoV6SH6cLOv8LC
	veyF8Xjf1DJG0xMD6YLjs2lmr2lCzLYnH9bjso5IcXb5zV6t7ZQuzk+QOA4NG4Hp9E4=
X-Gm-Gg: ASbGncslBoDwlACIlXDgmRm2s0SBHNbh2jof6+hLnf8pFuhMeFwomv4BgPYabzt4ne6
	RtJZToqW/4Wrl3Y0TeRGIZ1lPP8fgkgOU/IZ04Qm+tQmLRQ5Thu3W7+1GEtRpz/LdJ8VQUjigFV
	lvwsjWOlfRG+908Noh1gtgYaB5GgTZZBnRvB3qrUKy3ZLVpk0qHHk25ZOKjoAzYrWbMfKLv2v6z
	VQmwKyw7QBwUpnNJfobymlX+FK9ZhwyRTiAaQFWuY2/IoLH2Fqzb1KTGiXn4KhBezD8qtw9p/Zg
	ibfJtGDRlrBkQP87wEGwfRxr6cJ238zR7ZFhT4OuidSBmxCfkIL729yqRp7qBxfQymBH6Gp7b4E
	+xOZhu6HUWO2nmt2EHZtU04cX4IlDeCvUmyCXYugD+SEMqECRdg==
X-Google-Smtp-Source: AGHT+IEt6eCGHIHdgJ5Hbdvmi361TPvwrKg2DTzTL0d0QkRcJbr+DkoNmxRzQ+Jj9IKe7RsN66mllQ==
X-Received: by 2002:a17:907:1c0a:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afca4cff92dmr105537666b.5.1755081402373;
        Wed, 13 Aug 2025 03:36:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0e7sm2367644366b.114.2025.08.13.03.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:36:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-mips@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250729205213.3392481-2-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <20250729205213.3392481-2-florian.fainelli@broadcom.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: memory: Update
 brcmstb-memc-ddr binding with older chips
Message-Id: <175508140104.40429.8279921018476182386.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Jul 2025 13:52:12 -0700, Florian Fainelli wrote:
> The older MIPS-based chips incorporated a memory controller with the
> revision A.0.0, update the binding to list that compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1aba1eab0bd896928ae20dbf1f60a175a6e1ad0f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


