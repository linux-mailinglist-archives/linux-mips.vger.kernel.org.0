Return-Path: <linux-mips+bounces-4592-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D04940FD5
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 12:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465881F25446
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 10:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6941991CC;
	Tue, 30 Jul 2024 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8loI54U"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243F8194A73
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722336099; cv=none; b=KuSXEThXYgZr2x3P/yjyNOyPUhv47aBfmAouwu3XEvFlvImtUQpq6WUX3fwERoXSVOrWPppP/nz0pnksEsqedIgmkzVkPjLrM5kLaekvt8JbR5rKZK1WRfPDCjEGxkvyUjJitwdPIhJzzn5lqY+eSJmpYFgl3VSAPaXb+I7hPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722336099; c=relaxed/simple;
	bh=DhzCAI2qKRiMRe5MUI4Qm796RQ6OVVSx+lGb39s7xlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgL36jkNpOOm9D+cTeblEMoSiJzEYqZX+HCp8PRTXx2Ks9sfRaY07ppE4naemUGBirD1Y51qrNHPGSiIlmyzR4nQhIBeE2Wsr5fiRpbpOcbkOEQml6/Du8gs4MUp4m7kQWezaE6+xtVdQykC5JADU1NEkIzbuKGBL3SPMErpHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h8loI54U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722336097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8g9eu69hY+tFcVns2hzHdTrw7hODbFfcDdVx3JGaNxs=;
	b=h8loI54UCxG6Zff7gPnY7QgZs8eudQqQPEmbop9iqOUbDfVGqxrJ2AmzbmaefnxeJrLKwm
	56AOV8rS2crTqhzy126eCwJTft3MLrBbQDyoI7E9tUVN+5a9ttzDfbYjJBrBURQLejLGNM
	kIMOzOixwuevLkXWJf8kdDiK88K20Cw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-G0qpN9UnM62SO34qn7zpqQ-1; Tue, 30 Jul 2024 06:41:35 -0400
X-MC-Unique: G0qpN9UnM62SO34qn7zpqQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57c93227bbeso4348296a12.3
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 03:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336094; x=1722940894;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8g9eu69hY+tFcVns2hzHdTrw7hODbFfcDdVx3JGaNxs=;
        b=jjXfdHi3Rai5Qwj+g8v4M9uMH4oh4Dg0XiJarkK3J2xKKVOuT3BnbvWNNHVW3/3KYn
         LxiXMWKFp5zDjwE17O9kYi7JAkPNypDeA8ygmofQZ4s9uKJYt95fLqg9U1UQnOhwzHsH
         o2N/02wjm+IQAwJS7ctvZ2CHuh8FUNP2xJnb/rX0wzg63B387WNvKJThiZzZz6aBcE6o
         LXSISPx79SwzshpECUaM+5n9glontbwfow05laDY/hjIWZmTekiF50laX5mx25ILXYFL
         JfiWo63MuRsf4QWJPL44aoReWZBqZvFeFhiM5COaPW6yeoT/R1lG5KU8JNlA+YqZDade
         XFOA==
X-Forwarded-Encrypted: i=1; AJvYcCV425Q0D2JaQLVhjKWVvsyqLdU3LcATklOHcXHAlhpGJDRGHDb8T/0FaLt5PB7KFzi8vqh2jS2oFvojfRD3o0IYHDhVwFwrPPhuKg==
X-Gm-Message-State: AOJu0YzEcSIeCYjgpkDY1DbB/2ItTeZPQtZQkCeo5RRV8EDN3XbkWwSY
	6FQ6Pwx+GJrsl1CfP1AqLjsDUQtiTZVXiz8xnBCInZHKVpVTtAj512VwrRQ9uOfGsiJF/dLZ2TU
	290F1a31F9ZbBwNU6gL7vcladQf778GwPrtMzX05hRfW9U5qFx7zZZgSQhfc=
X-Received: by 2002:a50:a411:0:b0:5a1:7d68:62d8 with SMTP id 4fb4d7f45d1cf-5b022c81f43mr6159505a12.38.1722336094338;
        Tue, 30 Jul 2024 03:41:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDPyYZQ8rptYaeG/QLRVtJLyqTXdGIvl8oYe7Os3i41TwtBzRWbRKhmb66UoorwOaLwZdqjQ==
X-Received: by 2002:a50:a411:0:b0:5a1:7d68:62d8 with SMTP id 4fb4d7f45d1cf-5b022c81f43mr6159475a12.38.1722336093853;
        Tue, 30 Jul 2024 03:41:33 -0700 (PDT)
Received: from [192.168.10.47] ([151.95.101.29])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377e06fsm7118734a12.28.2024.07.30.03.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 03:41:33 -0700 (PDT)
Message-ID: <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Date: Tue, 30 Jul 2024 12:41:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
 David Stevens <stevensd@chromium.org>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-35-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240726235234.228822-35-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
> gfn=>pfn mapping without the caller getting a reference to any underlying
> page.  The API will be used in flows that want to know if a gfn points at
> a valid pfn, but don't actually need to do anything with the pfn.

Can you rename the function kvm_gfn_has_pfn(), or 
kvm_gfn_can_be_mapped(), and make it return a bool?

(As an aside, I wonder if reexecute_instruction() could just use 
kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of 
going all the way to a pfn.  But it's ok to be more restrictive).

Paolo


