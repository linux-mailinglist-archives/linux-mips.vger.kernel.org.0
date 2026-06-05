Return-Path: <linux-mips+bounces-14915-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a33MGYx6ImqcYAEAu9opvQ
	(envelope-from <linux-mips+bounces-14915-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:28:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8922645F7D
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ps89oNVR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14915-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14915-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB853102747
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 07:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E796C426EB9;
	Fri,  5 Jun 2026 07:12:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C0A3AEF2E
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 07:12:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643533; cv=none; b=ggG4+QbERrGOOdFWpozgi7VAcYVJX8+CmZG2Sk+SzTfrQWFFdkYvls/xKlJ48mfESNyjppKjhhYNlu86wfHa4T7K4Ny1GEg3D7PK9QYHrbwKLgTUGm0WOZPVG/xTyb2Wpf9Chho8gJJ3mAY20ErTrdohasgUOmkHhdWfUfkhWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643533; c=relaxed/simple;
	bh=LTLQc7ME7J7eUP93Wq//rFEEyGgeOk62Srx02OHipjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYt2UrSTslwtoKe4TqrEpqI6896NS7zPvlbJNm5/Asa/kAL8wd5EJYb1MwdYkoe2FaWsNUdfQ9mpuhkMa1JkqpO8PFid0f6L5WmP8aUyDMesu6VGbhJrpvy5W8fg3QtC2YXWKSXZwdcLDTBs5IME07PZqNkSgXuFq3ZDz/UOyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps89oNVR; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eeea039ebso801646f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2026 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643531; x=1781248331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayZZoFINc62/YbxwsJhIjKy4nCpiHkUbwPnuNcQomCM=;
        b=Ps89oNVRaZn5rmNq6doJt7zy/0DrYF9JhbwicNE+Arvwr/QS1dll52VQdATXxAl48g
         vJa3dIJuLWcz9Z+1UqLWbuec5xfR8G9UTJEdP/g0E0+bRhq5wJYc4O0EZ25CO74oXFrA
         ZJGMYMQkh99t3sgdCc5krpCpSVmBI1xsnLaxJz4dRrn4OaeNwBR2BICfsCa44Cw28Rfp
         jhFVXxK2hx9Pzn1H27o80FXr/LOoeOSMlb1ClJBWz0GW6yP07MqpftLhWzl7rapOl4lk
         zlPP0XJR+u8Dc48d3/jTu+GnODEcYz6kcZyP+INTfahdmu7YAf7gu5uqx0Z8SLIcNscR
         pB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643531; x=1781248331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayZZoFINc62/YbxwsJhIjKy4nCpiHkUbwPnuNcQomCM=;
        b=gHEeidKNTwUT7IeqON/ZfgLZHWu09a95iFS2rNeldqx14sGteTGlJPyJdoRSADlvd/
         f0e4e4iEQXpmWbB0Fvp02F+wBRghRA6zVVDOv1K4mARJF0qf8xIskzFwON6o+vW/2RVK
         ZLRJZhcZ02wX/H7eaoA03kRCCg9vDQokcjLUpWsIcC9ftrjlB9uhNA8thfJB/IaXogZZ
         m3jE8MN6ADesnRv3qRG6DVGq1al1iVlVKCmP89MpB0DfEx9tJHztW9u3mwrma/vA7Ppn
         pYeZiOfRYbRnPzyMRVG+czjZrgEMBnyn9tQUY0R8ho31YiC9PfCpQwbHsubbqrmtsmbz
         Zn2g==
X-Forwarded-Encrypted: i=1; AFNElJ/Mwzd2DC9S0deU+gK4A0aysR8xdcBFL8SDK4o9lrbLkshCNFpUR9c8XhdpKGVlCP6OKrG5eBkRbgkb@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdAVm9/udv4h3xmk9nUcnn7ui8Yvtxj0QCSUI3ByK7cN2oUhz
	Q0DxP9rvqw5UsfoomfZIUdXZg4yvuvfrSwVaJBxKptU8GvllZyVFrn/Z
X-Gm-Gg: Acq92OEcLkOnKxYIqw1syGcsRjVQk597J8Lkb1wzbjYkPPy+N+HNtyxPvntp8xrAr/w
	lP8AYvYPFPtzDcOBxOO60nIKf62Bf2LNY1qUAHQL99R9jyT7JaVZiRIBP3AKdNWfWZo2/HnrNQj
	No9loLg4mcpZpjcW87MT/lLFimFI7+cGLfUy3jfB+5MTtYddC73X9UWiKMoGceHj6xUjTjx6XDh
	r+7Gy5h8Oso9UrxA9+cBOYbFMwKk6MQfn+SfU6oAAaWdKEEYHki+Wy5Wvr8fz2OcIpM3Lk+6c14
	MJOTNUfpBRfFygHo8sQaMuHAKTwl2jRojP3P0tByALpBwlUE3LwAPEhFPGvEJAk2LO53PZrV8N7
	ET4YvyCY1064s9aczSRt6GWo+Pv0yUfJigpARVRg6G4Oli2554A32Z5ZDgpI4pQVNv7JJap/XjW
	wlYWZ3BnjbKH4vdpgX5yjFPhFxOvmKFgxkhgq+6Xt41hoAGsGxknFtUGFlsS0bYrKLgjS3sqEYx
	ITIuKb7TozlcR3HehpZKCO8XuIhg8KQaF2xb9qc8M938dE=
X-Received: by 2002:a5d:4e09:0:b0:45e:ea68:523e with SMTP id ffacd0b85a97d-460304fe066mr2960398f8f.21.1780643530812;
        Fri, 05 Jun 2026 00:12:10 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f133:a901:840b:2bf2:919c:cec5? ([2001:9e8:f133:a901:840b:2bf2:919c:cec5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm22213455f8f.15.2026.06.05.00.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 00:12:10 -0700 (PDT)
Message-ID: <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
Date: Fri, 5 Jun 2026 09:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <20260605064250.q0aRKkon@linutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260605064250.q0aRKkon@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14915-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8922645F7D

Hi Sebastian,

I'm not an expert in this area so please correct me if some claim or
explanation is wrong.

On 05.06.26 08:42, Sebastian Andrzej Siewior wrote:
> On 2026-06-04 18:24:07 [+0000], Jonas Jelonek wrote:
> …
>> This issue popped up during kernel bump downstream in OpenWrt from
>> 6.18.33 to 6.18.34, since the suspected change has been backported to
>> 6.18 stable branch [1].
> I would avoid the link and simply write after the backport of the patch
> or so.

Fine with that, I can adjust that in a v2.

>> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
>> generic CPU-hotplug offline path (and arm64's stop handling), so RCU stops
>> waiting on the parked CPUs and grace periods can still complete.
> This is part of cpuhp_report_idle_dead(). Is it now invoked twice? Or is
> something else missing/ different? 

Those seem to be two different paths. To be honest I'm not confident
under which circumstances which of those paths is used to take down
a CPU. In my case, issuing a reboot command reaches smp_send_stop()
where the issue explained in the patch message then happens.

> Sebastian

Best,
Jonas

