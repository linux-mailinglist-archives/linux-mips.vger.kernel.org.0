Return-Path: <linux-mips+bounces-12420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2010CADF8D
	for <lists+linux-mips@lfdr.de>; Mon, 08 Dec 2025 19:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED637301D666
	for <lists+linux-mips@lfdr.de>; Mon,  8 Dec 2025 18:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8AB27FD40;
	Mon,  8 Dec 2025 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbWJ4/wL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287826738C
	for <linux-mips@vger.kernel.org>; Mon,  8 Dec 2025 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765217797; cv=none; b=VfcFAEsoDfsLsklQrkrpKLTMYktE16aIVfN2eHfmSuxZTdv3SgK4FzhcL407A2rBGkglZfAOp1ogAyA0slKpLQ/zyXBPj/SSFcEUuogYEZeJRFZIlxj4HrM1gZYuJl8VzF/FjEq5lTGKIHGogehB09JT/+W0whBTNDClbJcFhhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765217797; c=relaxed/simple;
	bh=GaTGIUsHCRbA+CJvEJnX3R4M2tslrnRiQxBWt8LUJYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0NkV76C+mBKTg909eatEgEy/UWEj4TMrdRncPumT0Q62IFGkvhcJJQFVGA8dkxxXza1bo7xf3QguupszNXAgK+OIJbYbZJ3TQYlQjealFf+YcUEQqrZXtwSTzwN5psXsY776JFUHWM+G8rkV5v1HtGgis+y4BEyd1dw+4jlg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbWJ4/wL; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88043139c35so47256546d6.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Dec 2025 10:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765217794; x=1765822594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y76x02r0ebrJlFwjzgT6mGE9kYNZrDiEUslU7gRuUv0=;
        b=LbWJ4/wLq/4sPizwnXeI0r39oijDzTr6JPN4+LStpLZwKAUMjG99PZxc9aNxO9K8jO
         H//p5L7NX+d5S5Zi/pq5yMyRnsTaOlpFABlhRsIyPar9sT+/uQe21sQB4JeYo7IPpwKK
         mjTt8G0Fx8GUvzzzjxdg+9ZogsRHZonykvgxZn4aXGleZxx5DI1hiWleFeu2vlW1z6Qn
         r+1KWKgssoTrawkDkBe0BXzprQmYv8YDZZ20uQPHaTzekZ+1eAM9rEWNt2pX8YxCRjpI
         vxYdDF1IQKgrxaIBWKrgwkZ7zJt8npY32KB4MIwM/Hiejx7VMoX95+21+9xqO/Zq2OQ1
         bQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765217794; x=1765822594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y76x02r0ebrJlFwjzgT6mGE9kYNZrDiEUslU7gRuUv0=;
        b=HDgSHYxpEfLfIejHskatXKt+83JZdIdGTFPWaKO15yMHLuGDTwlMZZ/3yjKR9LNYPL
         OCuG7lLDEJ/VOG5MPp7N8WkHwZTk8fSrSlP7tBcBoM054vP0luYpZtca12kS/B7HB3Wc
         eMZKlkABvFgNmeALTUtAjTWxfg4Yg6ED5dUUWMNcQEM5Yw7b+WOAJrnaVutdlop3aQIh
         cfvJPuPNO/QlS4SLVKdN9gqsoa7tBfXUEmS1AMwsDFIJASJmpCZGjDG6dTGzFN3yS5ta
         kHqMONFdwC8SMHThlKzJatvmd74FYQQIB8aERwR3F6sZ1fQcqDM1hOPHQ5mSXUQA8CtY
         R65g==
X-Forwarded-Encrypted: i=1; AJvYcCUW337FprBKcnDXTYt7v53Ey1KdNjRqGh7nq5emC9Wcbq4PH+3NbYApEypB2JGfLExbIgiAK+1omfrM@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBv4wqXkom5Yknk1vFQBQeuIdJoD2u/mz5DzYrkGOci9bA0P3
	yjk4p2lSDLQv0EWJi8Paj9CjCAY0cej/5VK4uy9WtI5VML/1m3RU4dGZ
X-Gm-Gg: ASbGncujrhi+jHuLkwrEByKhlw1g1/BEwOAu3iGzyg1O829flltK2EJ089c3LLiu9hu
	vdoQmz+wvh1EkaApvePxb9T9CAS0+zbzP1QwnYMpGjho9Pi3+lryke7Y8YS+LMOpaZd82q9w2hf
	88NWU72lUFNkolUbVrrd+P+lIkEJs9tJRaLbbDceCQu5cYldgcBzO2fcc/+98r/DSnpBfuJi+Lh
	Bjya3eZg7CwZaodhpstG/tdD0v7TeVCX3a6w5Ik8q5RgUFePfltMey9E0Lr3VFYimoPkNHvElsd
	A2tUb+IBISB1195NWnytPChF6m3v4hxFx1MJYaxa0J73MZiUM26TB4Wcg5Zokt7DBIHzti63SDi
	27Z4MbKUC4cqTjKwfF/GAxSrcZlmC4hbjNtz29UY4S7Gvyju0b5fszthY1E4PJdIjcdMOZgwNdr
	DFpRbVz/ZRlTSNUS9pGu0VGZgFb6GeQa5t5nzcLA==
X-Google-Smtp-Source: AGHT+IHEg4/6Vqw7yuQ3zfLX/YIBI83Nsv/wJ8Aksjqr8LGVJxCG87bHmM2kXzaltnLZbv6mj/Yi5A==
X-Received: by 2002:a05:6214:c48:b0:875:ffef:682 with SMTP id 6a1803df08f44-8883dc30771mr144840076d6.32.1765217794378;
        Mon, 08 Dec 2025 10:16:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-888288013e2sm104539936d6.55.2025.12.08.10.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 10:16:32 -0800 (PST)
Message-ID: <c4212b4d-4728-4e01-b12f-43c1dc85436d@gmail.com>
Date: Mon, 8 Dec 2025 10:16:29 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Alchemy: Remove bogus static/inline specifiers
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251029150316.2522555-1-thierry.reding@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20251029150316.2522555-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 08:03, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The recent io_remap_pfn_range() rework applied the static and inline
> specifiers to the implementation of io_remap_pfn_range_pfn() on MIPS
> Alchemy, mirroring the same change on other platforms. However, this
> function is defined in a source file and that definition causes a
> conflict with its declaration. Fix this by dropping the specifiers.
> 
> Fixes: 8efb51ad1b05 ("mm: abstract io_remap_pfn_range() based on PFN")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!

Thomas, can you pick this up so we have working alchemy builds again? 
Thanks!
-- 
Florian

