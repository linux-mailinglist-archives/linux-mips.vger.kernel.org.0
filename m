Return-Path: <linux-mips+bounces-15103-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5uztDqCuMGq/WAUAu9opvQ
	(envelope-from <linux-mips+bounces-15103-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 04:02:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E214468B5F4
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 04:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=networkplumber-org.20251104.gappssmtp.com header.s=20251104 header.b=wAbfpxlE;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15103-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15103-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=networkplumber.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D52CA3019C84
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 02:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B67038D014;
	Tue, 16 Jun 2026 02:02:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988B38B7D7
	for <linux-mips@vger.kernel.org>; Tue, 16 Jun 2026 02:02:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781575324; cv=none; b=MaI841z64AVf20sj7XYuWyEcuO2ncw3IFNzHAYePc3keIPauRTmsxxnSqYMchxbbW2vrSea+Pqh7AFo+PeyjVWL4hCyznaLDuOvFMwwfz97s88sgfJgJN80aGLTkxd5ZpHL1vgFRT1wKn778A0sQoHiZSS+MwYSbKqHxyYPpJFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781575324; c=relaxed/simple;
	bh=GuqXIH4/Mp464G7SngNzHsMa6/UILMPguBBa2NVHWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjhjuTImta1n7o433ZtZeUntSZeSqrcukzeWoKB7hBz/moA7FTipMBUBFsGeRKfYFsPIXGaQ+MpEzyKTuLEkrnP8KdF0Tq3UPD+kJIPD67w8BmMM4Z2PP7ZTWXmsOhDObVEHYaA1FckxK1IMc1QPF9rFzBHTpBzLm0Qe9nphXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=wAbfpxlE; arc=none smtp.client-ip=74.125.82.172
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304d8362a58so2991654eec.1
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1781575322; x=1782180122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij2ukDXcMwBNLXQ6jucFsqZ3k4ldmE3wNeTpnN4p5Zc=;
        b=wAbfpxlEkKRwaRTaQS7Tr/pvDnqmdunDSPePGIEMriQJhK2PCPK/f3S8iN6OqzNwiZ
         AHCMPBOL+xuvLn2nQgZcqFB8L+i0Cow6TZ2ZQ2N10OUBVO9CAmhPjB0m56TBwdOA4XCB
         qpnEyyp0jz+LZojQcrrLKYeHdup2kqV8fP6cGExbbWnrrQV4kgMbYYwSKToLTtixl0a5
         q7tAWgcF5h1BubQngtjn0JBvtOvb0cR9WuSJuTZ8rVfeDs4WM3Wya+ozkzSI8rhvJkZ8
         lYwiqHwwZZCA3zCkE05FNCYD+8J/ANjJzrpw8lv64OsICvEC8djdOr9zoPlqv83oJIB7
         TaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781575322; x=1782180122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ij2ukDXcMwBNLXQ6jucFsqZ3k4ldmE3wNeTpnN4p5Zc=;
        b=iSPzvyqARV3WKznEvqp1fzVfSZPTVCmbS2rvjERo48HeTYR7vN3r4tZUBYrO46L04s
         j1oPd9GKXonv3PwpLpEeH8f9VyTjHYPnwNPP40YG3gUkZj+iN0Z4eB7PU/oDyK/VR4jV
         pDkwXvgH/Vq2j9JgZ7gbLCMcqSbNqBtXZvhHy/AeflzdYcLcSMw0xWVmg10iN3GjZeEl
         9XY6uBk2bBoS0wnT5l8OremG/xkREsVATlZ6em5tOZTPgbG8gQQmRowm22RC9W/jFjjV
         wcjnNIssFbXV+Q05ev/CcxAXXGZFTNZrHtkQbdH2+ITRVEVnNEWorSFF4yy9wfwQGeYm
         CPqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+q577N6uuSaOMFiAek9EVtsdIA1T0l0n62Nc2Bh74XdP9Iffx6pRrGe1jJZ/Zre1pVbQ8ZcfwnFH9L@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2GCVL53RN1VDUmuzgZRIGe0gaOKBDwXdprgGd6qXsz52JIXy
	B+yuHM5XDIB2q1xQX/Ha2WoWMs6Nrl+LEpFYTKfGRrmdHaEb0nnPV/QMBq1naI4sB1I=
X-Gm-Gg: Acq92OH41VvOw0MkQZwwiUVXoljmaaTAQqkCq1OT1c8WLRHPx5DzM4xEZlP9spXy2Qk
	mxH56n92Y6rCZOgflpdFiPQGinc6jsqAbujru7taWM7BQX+QKyw96KsAvk8xM4+gTra7aDdLu7X
	y/nRIGERjuwrLywNeMa4qrLvQboQ77NSzibbA+HjhH9Jl+zuMcw9uQr1q4N2tSF8wTrsHOJhCyH
	j8C5QKXcdKNMcvVkWa43lGEvo2FWRImcUjJcJ0jmVVVtWxoK+u/IWUssL1E9xpr6wM4C9G0S8xl
	h2gpD18FbwEAKRA4KH3V0fKsbPagpv+YUteSW/agxDuofwf0e0ppzCjfXrQVuheB2giU+pY1ea4
	Z/2KKLgFLVhqiuTeC7iCQq8cz/Ru2dRClVB4yMP8ADYkqK+JJbvk/xddZQ2ZTOsennsxtSB5y7g
	I0GTJli5dwjCzYdLG3AgotlS+bIPD6sxRuCF9eH/XLwFHD3af5izlh5coTRluDoQvk
X-Received: by 2002:a05:7300:691d:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-30ba33dbf37mr1207167eec.12.1781575321794;
        Mon, 15 Jun 2026 19:02:01 -0700 (PDT)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm18324839eec.8.2026.06.15.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 19:02:01 -0700 (PDT)
Date: Mon, 15 Jun 2026 19:01:58 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 geert@linux-m68k.org, chleroy@kernel.org, npiggin@gmail.com,
 mpe@ellerman.id.au, maddy@linux.ibm.com, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
Message-ID: <20260615190158.55cbf94d@phoenix.local>
In-Reply-To: <20260615222935.947233-1-kuba@kernel.org>
References: <20260615222935.947233-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[networkplumber-org.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[networkplumber.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15103-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[stephen@networkplumber.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephen@networkplumber.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[networkplumber-org.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[networkplumber.org:from_mime,networkplumber.org:email,networkplumber-org.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,phoenix.local:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E214468B5F4

On Mon, 15 Jun 2026 15:29:33 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> This tiny series moves appletalk out of tree, to:
> 
>   https://github.com/linux-netdev/mod-orphan
> 
> Core maintainainers are unable to keep up with the rate of security
> bug reports and fixes. Nobody seems to care about appletalk enough
> to review the patches.
> 
> As Eric pointed out Mac OS dropped AppleTalk over a decade ago.


Acked-by: Stephen Hemminger <stephen@networkplumber.org>

