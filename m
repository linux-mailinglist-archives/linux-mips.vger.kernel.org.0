Return-Path: <linux-mips+bounces-14158-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N05NsaX32nXWQAAu9opvQ
	(envelope-from <linux-mips+bounces-14158-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 15:51:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C30405019
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 15:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C444300BE84
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A763CCA1B;
	Wed, 15 Apr 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRiBoEz7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC13A962E
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261055; cv=none; b=shzA21Wff8XuyMKQuw/ncT9nK4AODUFP4eImg1g9Z0YlTUbuCHjZ9x7En1Ib5/YcL+Lm6UiEBYp0n3G2UwxsjtbachcDQLKdByfGE1R8LRHx62q/evpnkP54Tf6sQZp6RXdC96CP68dj1ntfO+E+vp8NwILqokBHIruVB7WNff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261055; c=relaxed/simple;
	bh=U+487OhLQwbQGEC3o68c/Wqllc2+HlIZTWx9rLHz0dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaU46eDtC/wY54LsvfkMZ1/DjoOMwLHD51H5zeKpnWsAfH2IWcqP+XvzXF6dBH3NfWeCf0j1nVGk4wyZJ3Gj2JndbN43lGtftnaao/NTefSAhNGx8inVZoyqvsOu4IB3W9dbO134ZUo7bRMGjTZdWxOFskAqeU5Iraob2O+mQ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRiBoEz7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483487335c2so75383945e9.2
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776261052; x=1776865852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5iMq5QYtaU6w73NtEmcRCL+AaB64xZ7+QY+pdlA04L8=;
        b=jRiBoEz7yLYNEz9J2c9bhJkDGFR6X+izTppxA4KGbfx9zlEKOUHdT58v3BH52dkUTx
         HlF9Je42J6f3JoQrz2rKLPXD6/7y4La6PVjckoixlZvp8S4i4xvrplcOEi+f8ZW8OGWr
         +WA4Czy4jH5T/zCmvUh4j/kJ8Hb03peqTUHr8garCaXURN1vvVnEnMQsJwhe6e0B9G0C
         0ba+vpH3nXwRhLU3vXt9MiwRGuuBKLoDTq5jpYTMCeMAPmWIhVNdgZz1oGIOdKkbCO5l
         UamUJ84ZP7gVDBV8HQ3PRRKV11RV/Iwee/aiqxTAGi5xeaXjg5Ml1D0uuc03ieutszKH
         gmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776261052; x=1776865852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iMq5QYtaU6w73NtEmcRCL+AaB64xZ7+QY+pdlA04L8=;
        b=Oh3oVPVQYNgTBM7wO8XXTnBCpbkrviz44qPForxLi6l5Z1Zz5jdGEllXiqgf7LbPUJ
         pDsoDVCKFUYu7m8qaAA/7wHDX/VOsGW8eNUmUxQO8HLro0eHl88DjWbmW/OGV2BfZkqm
         v82MNXMy1Z1nbmLhcfD9xetPkvHSnZe+j608Qj56EyyDsH24FXDoC5rvqqGXulq2ZGzU
         nVK/3b0zxoxBcFxB6wUcXxZRvcr0LsKMlcm/DWBT1w06SIJqSGe8LNK78TV8UFouAy6s
         imbRd8GXz00RB4vuuGe0Sm4PBnu27C7LNh49hs1VAAr9xRKj62zihHWtkZqpVc0Hap6Z
         +EoA==
X-Forwarded-Encrypted: i=1; AFNElJ8QNrAU/AvCZhxv8iP3tDLoBrILOhm7Y2JipHiyAYKXnprjQ6hY1pmkkEJVoWCq2QtonT9l4XPOq+6U@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyge+zxHIrWJmvJOD4HG66q7EGQUaCpgI7tu0avCrYDCeh8qDc
	tv0rN32yjeQHTrU2GmLcZOEt4KeuBsq+jFKIlVXGdonnBybQss2MkMQn
X-Gm-Gg: AeBDieuC/Tx8+4aEaU5yKHk/71vVBJcV0DbJq6gL4VOHCPnQmTVDZuF4YkFpCe1eFYi
	NVxjczWl0cW5ZapTGhQYw273rZGacihaQ/EKj8d438FeyiPjDk7s1kFtaIHbyyj7RfrHUwmUNRn
	9n6NQYG2vZ2rYqiycy/5hTou0oGlIrX1+iA6QfJAASkcw+sWHdXOAEAaKtESVg0uMlvTaK/L9NH
	Aari6Am32n2g2lr9wzdgACc8SUoU4hGZPJNBKaduw752APZ2qVN7aCNz14yI9CUBKZA64aDq9Yg
	nRe5+NXCck+i41QuYEvnkICNdBV7EmHy+JKnP61sSKHokb5Ig6V7clQzSOoUj1RKMgFvlToYmhV
	4DZa77ZJ2DO2YrUdD+f939eMTc8Yy4ijDmNSXk/ny8NVfe+kJHyxw41wdwy9oNQXyqy6cEbBMtz
	lFDUZDqgX1MEv7/JEqZ7fAhIV39KbPQg==
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr284879105e9.6.1776261052201;
        Wed, 15 Apr 2026 06:50:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f092f66fsm22778355e9.1.2026.04.15.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:50:51 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:50:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Max <m32285159@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <ad-XuNMor_ORjyOt@stanley.mountain>
References: <20260415122939.77847-1-m32285159@gmail.com>
 <ad-FcZeXsFlSPXQj@stanley.mountain>
 <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14158-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: E2C30405019
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 08:31:10AM -0500, Max wrote:
> Hi Dan,
> 
> > Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.
> 
> This was because of a struct with the same name, provided there wasn't
> the "_e" suffix.
> Just curious, what name would you prefer over appending "_e"?

I haven't looked at the conflict.  No idea.  Sorry.

regards,
dan carpenter


