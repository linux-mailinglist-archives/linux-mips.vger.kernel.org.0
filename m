Return-Path: <linux-mips+bounces-7971-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F5A4532E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 03:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D32617C5ED
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 02:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B720DEAFA;
	Wed, 26 Feb 2025 02:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GS/Ckw96"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB721A928
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 02:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740537656; cv=none; b=kSZe8OkmYIUCYj7Z37UdKNSlbsbYtMtj16+D5TW6YSaPpnbEAWY/xTCH6adDgyuxc2nG7L7U22itoqpLCbVYU555j536ZkZvXevBeIBpeIvUo9vs2cLdjJ6vbtL7gWQyhQH1oR2BsxIk2VxJCmil/1NTjP9nYqCUIyX6llZjwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740537656; c=relaxed/simple;
	bh=wjq1hhNmQD/Y69/cVuHxDfp8iNsL790jhspOLVSqRqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C25lopUSgqYTRXlJgsozVvBOOcLsTdXOypb6UygnKTCeUjSdtRL+45AD2mMaOul03RtcxD1OYWhuYLkRu2qcT57XrIqDEzxs+Pl31Sga1XqhOm8P/kasvA1YKjQ9myxmKonJpJkT41YfniiqVmKXZnVdnYkUTlLOGQ5RwmkzNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GS/Ckw96; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so12422554a91.1
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740537654; x=1741142454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=GS/Ckw967HgEBztwhEXtWyn70THH/82RU5C07OL+zjPuB1o1Jv6xlSab1Ifir0ySI7
         cL5y5aHYUTXGjIJG/uoPD8+e+FoBNATvn/b7FEXGf+5qZwa4gNPm0OYJgCeB0mU0d4zZ
         KD4Uj+Qqp4Y+/6DXM+89Yi69FY4OgAztNGASRC3TWKzLTTAmhpYRPo0AoJUWs99X/hZ0
         uOBDn9dxLPBSSwBQT2iBj5l5tFijagzV5pTSPoTfO8Hq9CNNPdc5VNomMbSKsdtWUiTd
         0sdZIJXxiFqZSo3/wnZ5sc6jtX6iDba7Si66mju+5Rs2hqbxDcVsBLQy75GMk9DDElJM
         6YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740537654; x=1741142454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faw8k4TIY5A7eHVQZOGgzqUSa20esi5XC3jgrNGM418=;
        b=WXrzzk2Pexc1IQlkD26U5t4RtPGqi3zAgKn+txdjtpGGXR6qzjCkBy+1TAdcbtNlkC
         Ezzc8U450v4N1C0x81tWHcBJpzjOdJhGYMeXyVpYN5XcpLP1GQ/IVBusKGQ+Pk0EEhKG
         h70UjWvxblA+tYrOrMHwM+9GtaZIMHqUqNzOyZUVR+vIvgZFeFg0za4/riJtVA0HtowZ
         lycN+01zUO9l6PhajaDzPnBdk55gJm+/0mKyKbbCrJNMGSBrn054vK3shUALbFsQ2IKB
         4Igu/oYuZJ16yfuDZ/vLS/cMk6sGNGamvNJ3+YEZydswHsFQh40Ov9cIweNmYRDuMsII
         IysQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKUxifMPhm6lp6pEO8ZrZEkHB42y91sy2NfkcBcBaaPjCBW7YsaBQnF1a+xNuL6LePZ8C6CFGOLzBp@vger.kernel.org
X-Gm-Message-State: AOJu0YylkMvk0eRFR3WwgIlOEO9Kaw4ThvdgUHRw366WOSDcXF79SUDG
	m3ZPxRw/NPDvTFS5pOhsQa+UMjqPuZmq7ki7l33NTHJKe7o3jQQRxYXw2p9JJL0=
X-Gm-Gg: ASbGnctiBBibBDUm3dS+1j/Awy8m+7QQSFFkfyVz4tnH54NamyHf5gkOlz8sABA1CzO
	7zJWnxeaL6ru5E3mVw7zq9DoXmjxNahNrKRKVv2df9ZhFYevWdiGW0X05n2FTdTyW/1swXQY9sf
	K3n3STYCaVJ3NkPFDhBNpXPngYn12Jf4YUzr3zsmVhWnwGrfg/Zjxp7ZEBziEou4BHy7/haNAB+
	jm43ZnbwXwW2cOPVQMmB9q9U4i1k3cCqgyiMSIMFnudI/pdSHl7YF2xaAcikdmH9gNWGhtm4WO1
	gyhNRZ1sPFFJjkM760WXYNPOjQ8ZZV378gVf77BuwEIS5DfkGg==
X-Google-Smtp-Source: AGHT+IGBavOro6p44pm0knw7epDm1Ms4/cRCm5nI7A9v1bvB0aFlwIUaa3TK9A89BXdQQHklrRCMwg==
X-Received: by 2002:a17:90b:2242:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fce868c4f9mr34212880a91.7.1740537654049;
        Tue, 25 Feb 2025 18:40:54 -0800 (PST)
Received: from [10.68.122.90] ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a000a01sm21742845ad.40.2025.02.25.18.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 18:40:53 -0800 (PST)
Message-ID: <3e3ab5b0-4669-4d7a-a7bd-6f5963662757@bytedance.com>
Date: Wed, 26 Feb 2025 10:40:42 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
 <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250225183519.91a5b75b13c0df6954c68576@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/26/25 上午10:35, Andrew Morton wrote:
> On Tue, 25 Feb 2025 11:45:55 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>> The x86 has already been converted to use struct ptdesc, so convert it to
>> use tlb_remove_ptdesc() instead of tlb_remove_table().
>>
> 
> This is dependent upon Rik's a37259732a7dc ("x86/mm: Make
> MMU_GATHER_RCU_TABLE_FREE unconditional") from the x86 tree.  I'll add

Yes.

> Rik's patch to mm-unstable also and shall figure it out during the
> merge window.

Thanks!



