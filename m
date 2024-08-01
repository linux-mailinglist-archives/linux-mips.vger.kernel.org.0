Return-Path: <linux-mips+bounces-4655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56882944CCB
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2EF0285EF8
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 13:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619441A4896;
	Thu,  1 Aug 2024 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OEgKXxpd"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71F3189B98
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722517562; cv=none; b=gUxzxVQ8LGKilCZSFnPpruV7gwLxvAsn8UTByN9ooUBMKQR1RM/SYbVKuAIXb9j3h2bxfOGN9r2io3nBL78qJyouGSRRkFEEsyzc8XckBTTcrEXbl/pxqR67i91UjV8/+9wg8vGKHpdY4fiZPBe39W1GBMvn2wgdjrLkzVWIoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722517562; c=relaxed/simple;
	bh=dMF81oEXFQQ/iabpVQPMzLroYQXe2b3ZlwqJv82n/wY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KduL6DPpjkSu6/QPW2h1qR20Oe5Uzd2DZnUQ+a6A2+tAFcr9Ljp2rQCZkEhRNgkRHeMed/g4ED0hWGTOtv84whZyfB+95wCj3Tf1qKtVyXhm2pTz/ULayVEeQPtzRI+ZmzJ686IK1IMy5Dd2fg459b406/U8epBLNs7GZergu0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OEgKXxpd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722517559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iX/3tIvoxeSLnt+NdQSfgM25JA1znfQTVzpC9no38a8=;
	b=OEgKXxpdy6qA9PQX7qWy5RP3vDHxfdyL+bK82gN+C/IV0IfY103zl9IJupAaclfylmuF14
	6kXpIfVtPuINXU9QqnxAXMQqL9O4njVLkHtbikk3t4RKMrg5GvoGe/F2LdUa2tsRgMdqR4
	Yv+o18mFkSXSXg1qlL/l16bvE435sjI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-fatCKLnSNCmsEMOxvkcBKg-1; Thu, 01 Aug 2024 09:05:58 -0400
X-MC-Unique: fatCKLnSNCmsEMOxvkcBKg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42809eb7b99so11970475e9.0
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 06:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517557; x=1723122357;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iX/3tIvoxeSLnt+NdQSfgM25JA1znfQTVzpC9no38a8=;
        b=fUJL6EvPNHukEnOLNaC3R5QNptP7EEifDdhnQG7KqX+VvSO5K1u/594MsLCUz+v/nT
         Ut5S+WOaGGeU0ADTlAufcq8U4h2lH1jWMkbKWq5gRMjvCZMlug55sRkHUFHrnIGOIK74
         3FsmpMbYF1I/PqnGt4hxnnRGdB8qi7ChwyRQT2e2TSFf3k0g4tJe9cqREV5SiqyIQC/9
         gMNqCBBRxnCNLyNIP0FsCVzW8VFDyVkixfE1FEr28BAKF4WLN30jzwxw7UarHpr3IYzT
         8HpBEbVpL3FgeX3KQWtmWfwemwDJWjywvWK0fk9EzqY4DbJCnStTtTRiRQJBSTZIm/GL
         EARA==
X-Forwarded-Encrypted: i=1; AJvYcCU0aAGDujR7oPQtGpR00/5Vmxmf5ZA4BAHzMKZ5zkAozMhr/ArkqckBcbl5odJPiMs/EBZ2IvwH7S9+svlEbXFNIkCU0sfY4rcrzQ==
X-Gm-Message-State: AOJu0YwFVrvApcn00dbM6oJYcNJDzXPHCAxeEI85nSO2Z0froKp1Zb6o
	i7lLVSNAT3HsLtUI7yKEjZzgGvaAvDYtV4XNH//XLqsLG6FAbS0Fuo20zzdiLKIbS5jdLW5Wvuf
	WgWgSksi32Ux9AbmopVxDWhuG+/4g/sVSRmO5gW5JfUmcqxeLZb5JJ/qSi4I=
X-Received: by 2002:a05:600c:46cd:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-428e4713f62mr14522505e9.6.1722517557367;
        Thu, 01 Aug 2024 06:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFECvW28n36dZHShXm0cKkJbtFTgF6/BuzcdnrjZeQVIa1Jdj69JYR8jefmTxcdnchFqcS3Xw==
X-Received: by 2002:a05:600c:46cd:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-428e4713f62mr14522025e9.6.1722517556809;
        Thu, 01 Aug 2024 06:05:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:5c00:e650:bcd7:e2a0:54fe? (p200300cbc7075c00e650bcd7e2a054fe.dip0.t-ipconnect.de. [2003:cb:c707:5c00:e650:bcd7:e2a0:54fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baa9071sm57779005e9.13.2024.08.01.06.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 06:05:56 -0700 (PDT)
Message-ID: <2a74db22-f2a4-4a14-8091-1e56962a6fa8@redhat.com>
Date: Thu, 1 Aug 2024 15:05:53 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] mm: introduce MADV_DEMOTE/MADV_PROMOTE
From: David Hildenbrand <david@redhat.com>
To: Zhangrenze <zhang.renze@h3c.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "chris@zankel.net" <chris@zankel.net>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>, "deller@gmx.de" <deller@gmx.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 Jiaoxupo <jiaoxupo@h3c.com>, Zhouhaofan <zhou.haofan@h3c.com>
References: <3a5785661e1b4f3381046aa5e808854c@h3c.com>
 <bffe178c-bd97-4945-898e-97ba203f503e@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bffe178c-bd97-4945-898e-97ba203f503e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> 4. MADV_DEMOTE and MADV_PROMOTE provide a better balance between capacity
>>      and latency. They allow hot pages that need promoting to be promoted
>>      smoothly and pages that need demoting to be demoted immediately. This
>>      helps tiered memory systems to operate more rationally.
> 
> Can you summarize why something similar could not be provided by a
> library that builds up on existing functionality, such as migrate_pages?

Sorry, I actually wanted to refer to "move_pages", not "migrate_pages".

-- 
Cheers,

David / dhildenb


