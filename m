Return-Path: <linux-mips+bounces-15764-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NfNmIut4UWptFQMAu9opvQ
	(envelope-from <linux-mips+bounces-15764-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:57:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A83873FA92
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 00:57:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="YmNWm/uX";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15764-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15764-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20014301692B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 22:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA08D409115;
	Fri, 10 Jul 2026 22:53:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7D740863E
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 22:53:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724014; cv=none; b=SA22ttWICcX+TIT4lKt8RhkDqa4sCMmUC+8Pjs9qD+3nmtW7hE1gD3pkOSTWN8E5WWc0ipU+Dyj39z/jq9IpAXADi4i8hmXtVBGWP1UtEjmCyACfOIL5Vmatd3snJ8ydOyZs4mZl1nA81LFfpIS4ZJKhzeJjMkTHrR5zToFNP18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724014; c=relaxed/simple;
	bh=XWDly2bshxB9+r2/vatmL2lJD5sH3CtBSsQ7Czp2trA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGSjJmDlUDEchaka6rgU1+GZW8Wqqm+GNUbnz38Gk9y80fdNxnVccf21Jw6O0DcibD/A6h3RB0ZA0tEgmftV7MGn9lQgN5D5tKw23H+x68NN1A55GCRTDwoNt1iDoR2WUIg6pvLUtGFcZIZvruxxqq1lMrmcoXn85c4oZWmHMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmNWm/uX; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47df440fcd5so743346f8f.3
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783724012; x=1784328812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZMuJmOMRKFkwmQjMCN1ntzaT1XaecLSvQONyrn+oG4=;
        b=YmNWm/uXDQQBet5OrbduqQirrK/7duWy2BKXHTGYyKoHhcnPTb9HaHt29eW9OvfKwj
         8qDcQ2mn5sxUWRWPGiwPkzvVO4L/jldp7jV42Sse8cywZ5IG8FnXMSiJ1/9j1cEO9674
         wJuQqcEDNpB+VnauoG8ETxR0IA9ZB97m611QYh0VtTM0FhlT7tZWquraZb8oy5bAk5Jb
         v6iqPJvs1eWJB5sZ1bkWaQd8UT6jGDyHyiJGR0++MIh8YPnrnBTJl+ANdgafMcwTfQOv
         7IyhD0dFcKppC+R6nRfN67mFEg0BRAc/ZMwQBZMnLvK/vJGylxb5VDMV1SL/WW2HVEC1
         166A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783724012; x=1784328812;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZMuJmOMRKFkwmQjMCN1ntzaT1XaecLSvQONyrn+oG4=;
        b=XoARnX4f99LV2guGBeEJOJjGy5TStEFS6DR5R3trZ/5mUXEivZ1Q8QNxvnAKHqyTXU
         sxX1KaHzEaxe0fof6ynty9G7Tp55trhGJi5bIcpm4ZyzmjGLsUUabsXagF0Gn/4D6NRo
         /sCiEuPHL3Ly55BVZ7NQGGFzRZO3MXG9G/GDjFx5XwVBH6uV4onmnsnOaCSR6sqmG9jg
         ka9P0yIZH3A6Ugw7yfAEB8+JE6DLCGTK4Re4jtaWHitGJ/5U9YY/M55FJaC4UzyW2Rmu
         YnJ9Amj2BoPrSaYVm5FtN84py30KSSdthWTQtJH/sZhTDgUlkUtr3dPAKNT31qCT45Hp
         9ysg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4BdynhBKVLzzX+jEdJvygpULfuD7RSj65vZMcjsqytZzuigt4BhesbGq8ECSTE+1uPzyqlWfOZ1Iz@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5DU9D3Bjsc60kxtC/YcIQOlETnA6RZzwlon7jzN83EEkrBfN
	t+0cLaOSE3TrFkonvJc3BUqysH5qBeR+SFETmWWFtyASwSUnzkilYw+e9ihZfA==
X-Gm-Gg: AfdE7cn3dkh0wDvLtHgki1L3mNZpVd7ikVfWLPhfbkPWK9+ndMQdbrrg+QQRRE1Flqu
	Lpcg+c4dZOujq0dIWBa0ZdcAroZzR0uLGXCHsANHzKfOLBq2uBc/OSAb9nR7x1X8OJDlh7eA0Qe
	erhyby4AJd15FN+EOMh1sMlVPu7WsGeqxqyjDztzvKA4BezUSH+ubxEe7HfWNUxRSovqGkiAxna
	vhsQRV33yt2s5ImQv6FmiCvwflvdkVVoN7tKE6ELogC+6W1imTE9WIKp2RfQCrguE1T5NBcTs9X
	TqdQ8OyahA1/jFbnEsbwbu/CoXw4vcgX6Nkq7kVr4aDTqwrU4CDE3Z//V53qsirxqqUtV9k93YK
	pz2cg2x3jdZ0jSh8Xv3uJN+fjEGSzVTsmU2kG9jJVNZItf5dADE6FaUchvT4ebpNnUN4qZvG7Fy
	7FsPppJKXoiKVtLeDCaizyfgTK43z9hE5BUTFBtIoNJ+DPlB39idy05ILHfqRcuRSe5U8g/rVu0
	2tkYK/InMOg20s=
X-Received: by 2002:a05:6000:4010:b0:47f:2baf:5e31 with SMTP id ffacd0b85a97d-47f2dca845cmr596773f8f.1.1783724011546;
        Fri, 10 Jul 2026 15:53:31 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f113:9101:fced:7ed3:a061:c995? ([2001:9e8:f113:9101:fced:7ed3:a061:c995])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm64826572f8f.0.2026.07.10.15.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 15:53:31 -0700 (PDT)
Message-ID: <84daa623-6767-437e-915b-933dbebd2e8a@gmail.com>
Date: Sat, 11 Jul 2026 00:53:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/175] 6.6.144-rc1 review
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 stable@vger.kernel.org
References: <20260702155115.766838875@linuxfoundation.org>
 <34b7e26f-df63-4523-b4d2-5de13c192a8c@gmail.com>
 <20260710163023.agent5-0013@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260710163023.agent5-0013@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15764-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashal@kernel.org,m:patches@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:torvalds@linux-foundation.org,m:akpm@linux-foundation.org,m:linux@roeck-us.net,m:shuah@kernel.org,m:patches@kernelci.org,m:lkft-triage@lists.linaro.org,m:pavel@nabladev.com,m:jonathanh@nvidia.com,m:sudipm.mukherjee@gmail.com,m:rwarsow@gmx.de,m:conor@kernel.org,m:hargar@microsoft.com,m:broonie@kernel.org,m:achill@achill.org,m:sr@sladewatkins.com,m:f.fainelli@gmail.com,m:linux-mips@vger.kernel.org,m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:sudipmmukherjee@gmail.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,linux-foundation.org,roeck-us.net,kernel.org,kernelci.org,lists.linaro.org,nabladev.com,nvidia.com,gmail.com,gmx.de,microsoft.com,achill.org,sladewatkins.com,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A83873FA92

Hi Sasha,

On 10.07.26 23:03, Sasha Levin wrote:
> On Thu, Jul 09, 2026 at 11:45:14AM +0200, Florian Fainelli wrote:
>> On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, same build failure
>> as 6.1 for MIPS:
>>
>> arch/mips/kernel/smp.c: In function 'stop_this_cpu':
>> arch/mips/kernel/smp.c:396:2: error: implicit declaration of function
>> 'rcutree_report_cpu_dead'; did you mean 'rcutree_prepare_cpu'?
>> [-Werror=implicit-function-declaration]
>>    rcutree_report_cpu_dead();
>>    ^~~~~~~~~~~~~~~~~~~~~~~
>>    rcutree_prepare_cpu
> The offending backport was dropped before 6.6.144 was released, so the
> build failure itself is gone.
>
> That still leaves 6.6.y and 6.1.y without 9f3f3bdc6d9d ("MIPS: smp:
> report dying CPU to RCU in stop_this_cpu()") while both trees already
> ship 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single()
> on PREEMPT_RT"), which is what exposes the MIPS reboot hang that
> 9f3f3bdc6d9d fixes.
>
> Jonas, could you send backports of 9f3f3bdc6d9d for 6.6.y and 6.1.y
> with that adaptation? I'd rather take the author's version than adapt
> it here.
>

Sure, I adopted it accordingly and sent patches for 6.6.y and 6.1.y.

Best regards,
Jonas

