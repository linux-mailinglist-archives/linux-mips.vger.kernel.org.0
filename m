Return-Path: <linux-mips+bounces-8069-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E60A4B838
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 08:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F253A8723
	for <lists+linux-mips@lfdr.de>; Mon,  3 Mar 2025 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36441E9B28;
	Mon,  3 Mar 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f4A84WM5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A21E5B6C
	for <linux-mips@vger.kernel.org>; Mon,  3 Mar 2025 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986140; cv=none; b=DXElZiktKrgXSYfqcKHkIHHGceJ6qd4XacWgpppKCMZexTsRF8xfT8xNqT9gjjfX3IUgbrZC2z0Slu/fu7YaMJlNnBjx5BeMMBmyXRPwsfdfbzYaKpsGzKWHh9y3qlXQJzwAkc1V4loGaHhJK/I4N1Kvi9rWvzdmiCb1QyzlNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986140; c=relaxed/simple;
	bh=cyZ+Grt5WsWeJ35wJ4Miw4zucqCOoTXmPw42CecotaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRHG4qa/A2btEukAcWzbjJwg8W8Kuoy+iOpGKDgvIPrQPOvexp0JvX6PQ9NOi4wb+XpZdVNwFT7YEmXa8FprlkpYnsJ/280Fjl9f9KWQyMG0e75rigIsBwLOMuSYfr3NAxpVVbowAHhb2fI5CXJiYNwj8zH8qxq5j+TmQJBu93k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f4A84WM5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2238e884f72so19108625ad.3
        for <linux-mips@vger.kernel.org>; Sun, 02 Mar 2025 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986137; x=1741590937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=f4A84WM5UBmOEItKzAifDxDy7QSqQog+5OdOY7cDip+Ifi/SFUtojaXd3nv9N46OkR
         obbn8XiDHfPwzOhP+v9F4yJio5kY6Fy6S6Dij4j9DhRO+gigEV2oQ1XDcdtvMOTvOPmE
         WpuxN3y1/iFpfhe6FIe7LgfmoW5WjaSdqf2obCSIVsNV4KU9GPJlIYbIQ+dtrHsEz8Qj
         obAsvIJ84Xaa/DfhJQP52pW8eNlzAzvKCu3ybiqdRykVPzSYIGvK4+hUWmRrrn+BPGQx
         E1zuno2Ug6TvBtzOsf/XTEeGekcF2JdKNte3lMVXw8TZSOU37BEEcnrYWZ+wVCIGz6FH
         p2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986137; x=1741590937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=Y2hOL07ESPjWfK3+43hUyb4r4SrbBPUNtQY8n2JpFacFfNRd9k117DPoVjVDUmaoXa
         HWxlXQXYKaw7cUULzo4IWuazZYQKVf/3R8Z/snO4Jp+C0GfT7WhcF7fh4m7ehyUPlDBy
         G0Ze8BdyzFlMGKhwlhkQXfEhNXXRZbS/tqqA89ZMlHmOfkMC51wJFiCKVmNW7F/trJuf
         BfPZaE20LW2MFLVBrlhlEzUCdQC7+gy0J3qVAbDxqx3dQ/GRNxAmI6tpjMiS6zvAazLX
         q7LuW97Ee/I8Epls7g1dY+DpteIiHpGJ69oY8nCx5Hd1QxBE9qH+fOpBPH+P2buO/CXP
         JTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc8YpSZ4Bi6N3F0dxxulRO7Tu2D3S0nCmdNm5ZhfM9e3t0D7mV3sVo/X4KsGfT7A5sp9bM8Blz9HzL@vger.kernel.org
X-Gm-Message-State: AOJu0YzJvxekgaJd84FVVeYdKrFF0sXiSd4zqh/PkBPjh6WwdKGdiQ0+
	xRYmEfvifeU2mNXm71UFagxJGFn+ZlWg4SRM2PRHTBEp6lTrrjVowaWw+9rMdOw=
X-Gm-Gg: ASbGncvVF+C23Zbs2PqjpHqctlpbBBjhtY7iKFxTb37FITJe1QztqTwfOte/yiEHyzT
	nJXhEyh8v8kvI/H2Hi9GNqCxziDPIC/ZusU6ewsloLmY6ng+as9ga1ni/Sot5posPjETpvfRUjQ
	phpyP5lPO00OsUpcW1c8VmW/j4xCceT9G9qTIJDiVDUR55tLUzG5I8ck+jXtRXwnxtF71Iajf+T
	VkKdtj0aUtyclt5jH4+ffweVeT1sB+a4CudSBXtROj/jbpLW+aV/FCl6p+7hu1QT8he7GfCHfBW
	q9D+TZlhE47Ne0AXi8TSrd0EkWYY4eUEh6wsSzzUKLjQp6WUWJmCJaIEdasjt1Lai0ODLw==
X-Google-Smtp-Source: AGHT+IFFzAQLESy+9XTrR371K4l9s8+Ug8zXVzf/oXiEIXCRNjxwSBTp4Oh3Iq6eaMxuwqzsZm0CFA==
X-Received: by 2002:a17:902:f64a:b0:223:5645:8e1a with SMTP id d9443c01a7336-2236926727dmr181629675ad.51.1740986137075;
        Sun, 02 Mar 2025 23:15:37 -0800 (PST)
Received: from [10.68.122.90] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050ce10sm71093955ad.200.2025.03.02.23.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:15:36 -0800 (PST)
Message-ID: <4eb93ca8-7526-4709-b43e-2ed9e5583e3b@bytedance.com>
Date: Mon, 3 Mar 2025 15:15:22 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] riscv: pgtable: unconditionally use
 tlb_remove_ptdesc()
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
 <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/25 9:45 AM, yunhui cui wrote:
> Hi Qi,
> 

[...]

>>
>>
> 
> This set of patches mainly refactors the remove page table function
> interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
> was no longer needed, and this patch handles that.
> 
> Additionally, whether riscv_use_sbi_for_rfence is true or false, page
> tables can now be released using RCU. This patch changes the previous
> synchronous release logic (for !riscv_use_sbi_for_rfence) to an
> RCU-based release.
> 
> So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> Based on qemu-system-riscv64, I tested this patch. The log is as follows:
> ./gup_test
> TAP version 13
> 1..1
> # GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
> # ok 1 ioctl status 0
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Nice.

> 
> So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thank you very much for your review and testing!

> 
> Thanks,
> Yunhui


