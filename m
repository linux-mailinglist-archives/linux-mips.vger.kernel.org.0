Return-Path: <linux-mips+bounces-7644-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E1A23091
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 15:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B090188517A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 14:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C591E376C;
	Thu, 30 Jan 2025 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5cqgLH5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A121DDD1;
	Thu, 30 Jan 2025 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248393; cv=none; b=lsA1sRTGHRz2AhxH3RwNQ6IXp/Grsoa3fGFss8wwDKaotm4I8hCHfwVkDi/ValVb4e4wygZUFnwOdQQVVSxRHq2hsv5r5kTsZn7z9gqOlNTELNTif8nfbbXf1ax55KL8rU4l+U1jBq+qmxe6fust+wDdPvrg2GCtivQICtywUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248393; c=relaxed/simple;
	bh=n40KgGfq4R3RPQRYAd/cIB5irFErGwpGuPD89/Kd30w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OO7cibY58rL4NPgMYY6MDvbhexURAMkHhSQWvm4N8ZV048Br8Io/sLG0TUeafLqsEhEDxpH568CRCX5eSklT6HKx6fj69oH1j2cf40ykJl8yGU9f1CazvzeGmIRROnaEVCvJ9ncaxxfy/G7IxJIkfvgQIm39mdR+QKkfSc9nqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5cqgLH5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166f1e589cso21890165ad.3;
        Thu, 30 Jan 2025 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248391; x=1738853191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8qNxMXCgnej9fTeqFuWVgt08SyBzUFps2b0/X6hKCE=;
        b=E5cqgLH5FtrZwOw4yhDdHQkvc5gH5vw+ULBZRIQpx6OdEtAr4E/ZNmoLPSVDYJS1TV
         +5Ff9sn5Fqr0dah8us82lPj3M079/X6GY0rV8gyGHYAz/CNhJmE0vwzSAjtKuG6HM8rc
         Pl4Jw6dvUlUOVOiPh0aNgl6rM6X8i/qiXDJIwNhu2Bf23mm4KHgF9ymSO2ljfkacsREU
         5FRfzs806e+KTv0hkTaK+NbYCMP/ZtXbwANhKQFw0zxFYvqzRCfHwl7+eKFKsGyiqPZa
         YAkHTGrq6825qtZqztMcFZ7nmhb5yfXJeKrZ4t4OVO+BwMEPlAZEWbn3qgeJ0NUgNwzz
         AvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248391; x=1738853191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8qNxMXCgnej9fTeqFuWVgt08SyBzUFps2b0/X6hKCE=;
        b=THwVGHfblQ2JIKHnT+S9RrsuquTnXXW5fbGGEXWVkEBcAFF0i6jy/uygajqCNy0zt/
         tzIoP6WBBz+pq8o7FbbmcH4JsGKw6BaPV4ttc0PkC0Muc4TMgdFcZ1RsYiYtUbo2ORQS
         Hgao8iJIVxzulGhaADAT8Uv+e1SL97T2Y7DGF68WuXGHJsjuFeoyYImWp54yn3w2SSVd
         5GhF+fX+4ciDxiMORONMMS0wSRPwHLEA+J9y9Osd+N5+KwBygFhuSjuo1HAls/qro6HP
         LcPWoHgymwp7mQg3cgbFeM4/h571jl1zkMP8Ng4z9FQGdZqxnRGdv294EfU6Kk6s76T1
         cjiA==
X-Forwarded-Encrypted: i=1; AJvYcCU9aAn3qa1WPAY6yKsu+SM2fzjApc4UOzzjWb/Nfwwpx6WX54v+yvpgUb5nO6N3FD6EBfeJE+To0sR9jj4=@vger.kernel.org, AJvYcCXRuEXlLt/yGBI2FQqx+S9zXVdF0sk22gzIKCa/sJBz1zKBWWMzwJU2Xohx5nX9+GSEZbN7JsTBpt0b5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOipQMPJsV026mSo8CPPebJcgbHpCP1tAiY3nFHKexm0sDCHVu
	YEPzOGrh3ixcnasnvRZjw2D8l4PLYuDGcK4hY9O2FOtVQInW3lRY
X-Gm-Gg: ASbGncsmUYZf00pkBfHYMVZlDYOq+uMhi1fdyN7yFPo6YqkjRdo/96kWP9Mcg/RIx2o
	rMq8yzK+g0lpSPDJUdnhAw2kkBRjPQ/RpVgGC63gH4wU/8ZCq8ceAgjQtInBuchfnVJMb+X9h6R
	0gyVdvekDhD39VU4eHlB0qbA/2fDHH3YviT0f6Z7YYemQHP2/na3MF7qckSvlk/W6ay/ch6yn1G
	dpIuS/UD6MrNeTixlY4I98fNSoahaMfLVrV8AJs0pUvX5PiVhmqrmV8CxUcHyNJl4Qy3LKlQ3ea
	7qzmsz9HwEG+ecpvOXywo5YE9eEbxK8uJNj5VYz/OI77KJ+RjwLOD1sR0PyUeWhojuwG
X-Google-Smtp-Source: AGHT+IElmKsyKIeuSlrMpwizU7bksy5wTpGQU6CRdT2tmwDjlv0NRKupiacbNPo8vNKEQjj9pE1VYA==
X-Received: by 2002:a05:6a20:2583:b0:1e1:af74:a236 with SMTP id adf61e73a8af0-1ed7a537caamr11860969637.21.1738248391485;
        Thu, 30 Jan 2025 06:46:31 -0800 (PST)
Received: from [192.168.50.88] (36-229-232-242.dynamic-ip.hinet.net. [36.229.232.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe8568fesm1457638a12.40.2025.01.30.06.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:46:30 -0800 (PST)
Message-ID: <6d0659c3-fd86-4eab-879f-d9b149462358@gmail.com>
Date: Thu, 30 Jan 2025 22:46:26 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: fix shmctl/semctl/msgctl syscall for o32
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens
 <hca@linux.ibm.com>, Jeff Xu <jeffxu@chromium.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250106115227.1365643-1-ism.hong@gmail.com>
 <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>
Content-Language: en-US
From: Ism Hong <ism.hong@gmail.com>
In-Reply-To: <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Arnd Bergmann 於 2025/1/28 清晨5:20 寫道:
> On Mon, Jan 6, 2025, at 12:52, Ism Hong wrote:
>> The commit 275f22148e87 ("ipc: rename old-style shmctl/semctl/msgctl
>> syscalls") switched various architectures to use sys_old_*ctl() with
>> ipc_parse_version, including mips n32/n64. However, for mips o32, commit
>> 0d6040d46817 ("arch: add split IPC system calls where needed") added
>> separate IPC syscalls without properly using the old-style handlers.
>>
>> This causes applications using uClibc-ng to fail with -EINVAL when
>> calling semctl/shmctl/msgctl with IPC_64 flag, as uClibc-ng uses the
>> syscall numbers from kernel headers to determine whether to use the IPC
>> multiplexer or split syscalls. In contrast, glibc is unaffected as it
>> uses a unified feature test macro __ASSUME_DIRECT_SYSVIPC_SYSCALLS
>> (disabled for mips-o32) to make this decision.
>>
>> Fix this by switching the o32 ABI entries for semctl, shmctl and msgctl
>> to use the old-style handlers, matching the behavior of other
>> architectures and fixing compatibility with uClibc-ng.
>>
>> Signed-off-by: Ism Hong <ism.hong@gmail.com>
> 
> I just saw this making it into mainline and had another look, sorry
> I hadn't caught it earlier.
> 
> It was an intentional decision to use the new-style IPC_64
> semantics on architectures that didn't already have the
> separate system call.
> 
> You may not like that choice, but it's been done this way
> for seven years now, and as far as I can tell, glibc relies
> on this behavior.
> 
> I think this commit should be reverted, and uclibc be changed
> to implement the kernel ABI for these syscalls.
> 
>        Arnd

Hi Arnd,

Thank you for your explanation, and sorry for the late reply due to the 
Chinese New Year.

 From your response, I understand that the preferred solution would be 
to modify uClibc to align the behavior of semctl/shmctl/msgctl with 
glibc and musl by adopting a unified feature test macro. If that is the 
case, I will work on preparing a patch for uClibc accordingly.

Please let me know if you have any suggestions or if I have 
misunderstood anything.

Thanks,
Ism

