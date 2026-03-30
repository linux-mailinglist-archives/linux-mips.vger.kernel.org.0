Return-Path: <linux-mips+bounces-13990-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DlfHR1kymn27gUAu9opvQ
	(envelope-from <linux-mips+bounces-13990-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 13:53:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E476535A9ED
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 13:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18B3D30160FB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 11:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B293B0AEE;
	Mon, 30 Mar 2026 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRoMQ4qZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401DD3C944F
	for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871525; cv=none; b=MjCPesYXekCNu5wB8hQqp1qCQmVHQnYnpcxfpcQNmSXiSviVyVgDMTxY8V4tw4uOOD142EsDscgEpYOySo3HfK20hJxK26J5nZpwXY59LwO1CSz+Zq80lXczpwy3YwsGJJeo0N2n5AfpPBNEaMcTBiqrQcLqMn8CXvu7VzkkXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871525; c=relaxed/simple;
	bh=tZcULxHj5V0iA+N1C3dGSr9T38DlrHQP6YwqsGs0kkE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCh5Z8bSk4l1aHkW9+jabImm0c46JP44OrtvhYzmI/JuOdr6NWVoRj7e+jVwFmyUiLHr/SU/c+hMXtnO4f5sQG0qVwxmE7Y3Qn6Fwwb2eylQlEPBDRtxbjy0EXFKhAWs/uLUlABG1n67IyEP9ylFKiGpKHDMddnseRZRHBNmERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRoMQ4qZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b949bf4easo2530055f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774871523; x=1775476323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jxUu8FUh9u9Ljj/yOQuXagWoNZOfHM1JD0/FDxW0pI=;
        b=eRoMQ4qZP95s0561zmqDf/oOa/r8lQq89gL7XMKF44f+vE99mLm4ujqy1Q09866mRc
         Gz2By5/ixrbeaOoi4ViigHlPGQOKmaZ3dMkoqRv7/0sgDZ2bWWL6Segj6H+C+VnKx3M5
         cxxcBX8XmPZu3+V/4b37ToZ1R5YABwfSKZVC77Lq6g8g0Mmu+aCCV/zCNEygmuYotqSl
         tCTHhnu1eenbE2sjNkSS6XjjY+dECocs9DVS2WEoDF66Vg7XM1Zp8S2qtWBWqA0d2+xQ
         Ab0b6wdt/Enayazbv5jueSaSPj2faD3jrImNLeKLZwD2xxYVanbnglfimXGguCRCCizo
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774871523; x=1775476323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jxUu8FUh9u9Ljj/yOQuXagWoNZOfHM1JD0/FDxW0pI=;
        b=kGBd9Wsi+kxJD2Edn628JsnhcOBOgXVlboEOKrUhl1kuEInGGB6sZD3b5itdeYnjwC
         zIE8IoMsI8MCV28HSxYwZqDLcanSIC6mM45As1Ihx0TaZSlDNo3VRd4o4f8RfEiKMsTX
         t/bli0DVUgkVcJ591AZY03G/eaxjGduz28ryxLGl7yLlSU8Y3HIooswomMGWsh46L0fP
         hJLOnDTgdeRcwHgc9G1BW7LgTGCX5U1H3aUvKbU0C8Jrj2k+sH26rG9BS28aICnWg/pF
         IXT+6+uSN8JexJ4+R95AtAMNA2B1pTmlzQbmIfznt3sDdyeOHjxZKNeBdXPLcB9ar+jT
         T65g==
X-Forwarded-Encrypted: i=1; AJvYcCXOu4w98lZZVHSlCjTHa7jMgNRnNixip8UKhLH7XKu9Li+DuSnquVDnXjKLtXau4hkEuNrdkXNLFgAO@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9FVxql9zhZjSDozOrdmehtQIq1JATr4ECg4Vyhz/819SV/Ra
	gdHb6Wnzkk21BdXs4aFQ9QXMLJJDpTrMq5ANUZkJodmEQ5y5eCBqTCMFAK6CeySO
X-Gm-Gg: ATEYQzwS0xDh/YuxRLw/Amd1/mGQ1xgvERpxqOuP5DPFTrh3KEuW1/3QD/dn6pbW88Y
	iDAtPCaU2FC+aiUJzyELQNeEdi8sBn7LMosEXtlJ08qWg9X7hA05ZUPzwgARxh744TwB1EAuWiR
	NJAiXedL8RwlNrtNAyIfP/QjZIUVWhBzNoZTlcd3wCSJAEjIyKp0G5oDv6PKf9u3BXiWmZf1sN/
	rs1nYYjrWs+PprBKDuOIgU3C3AoPXQCJbiHsHgVADVrdil73e4PiHYNpn4DJcnIrEERZS+LFqav
	2jCeW37JmafI8y4665KzSD6A0x1XCXBw0IaUzX/A6moYEG+MCZfZE/tmA+6tRek/DVJd105hQQU
	gv8qIKQSsKWi76NZcIDP9JWNhdDxGPlHZsF9UJsJOwtwbbd8gowb1xaci5Dv62bQVP7lIB7xitR
	1PXYor4S7vE8Cq/dy/d865SUm58lgw9lh95GKWQ9we4DtadMtgBhormYjX3uap
X-Received: by 2002:a05:6000:208a:b0:439:c153:ae3d with SMTP id ffacd0b85a97d-43b979fbc99mr26341047f8f.6.1774871522357;
        Mon, 30 Mar 2026 04:52:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm19069266f8f.19.2026.03.30.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:52:02 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:52:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix the GCC version check for `__multi3'
 workaround
Message-ID: <20260330125200.1cdd9994@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2603301108170.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk>
	<20260330104644.1da584e1@pumpkin>
	<alpine.DEB.2.21.2603301108170.60268@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13990-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E476535A9ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 11:09:43 +0100 (BST)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Mon, 30 Mar 2026, David Laight wrote:
> 
> > Although it might be worth just deleting the version check.
> > __multi3 is unconditionally defined for sparc64 and that is a much
> > more complex function rather than the pretty trivial mips64 version.  
> 
>  We want to catch invalid usage or we could just link with libgcc.a.

That would pull in all sorts of expensive functions - like divides.

One option would be have a 'u128 mul_u64_u64_u128(u64, u64)' function
that architectures could define, defaulting to (u128)a * b.

Similar definitions exist for mixed u64/u32 arithmetic on 32bit because
gcc tends to make a proverbial 'pig's breakfast' of compiling it.
(I've seen explicit multiplies by constant zeros that have been spilled
to stack!)

I recently improved/optimised the nolibc snprintf() code; that fell over
the same problem (on both mips64 and sparc64) doing the div/rem by 10
using multiply by reciprocal. I'm not sure how the kernel snprintf()
does the conversion - the entire function needs some TLC.
(That would probably speed up things like 'cat /proc/interrupts'.)

	David
 
> 
>   Maciej
> 


