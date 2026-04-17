Return-Path: <linux-mips+bounces-14190-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPQ0HpZI4mlh4AAAu9opvQ
	(envelope-from <linux-mips+bounces-14190-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 16:49:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443B41C39B
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 16:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFF5F303D723
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 14:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5853BE620;
	Fri, 17 Apr 2026 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBi3yKHM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890B3B8BCF
	for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437170; cv=pass; b=iXD/Y86D/UDO4rjJUEK8hy8yHN5PO4SpvwX8BTiX3LN/Nn8NxAmZVr8y3WIMn8ynQvUbQqdXaVBL7vyKy8UX8ta0kGBqTy6lxX92WO0JY99Ssz9wfG6HZ9YiqkgLcOHJLq/8nBx/igQbmqds5QOT7XhPKem6pv880/GjQp5Aai4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437170; c=relaxed/simple;
	bh=nqmFv4kJsR3J2aeOVpvpDPnV1MGIn0Sla0J0a4RiMvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/dU37nQu0H2DSnLjfRMZaOqBf+VZFtUgRapaJqR+pTyGYiRv8oFHCnShGMdfCmEsgEkgWeA4mO5dRUvdIvwpMe5E8ZByDQXaeIfxlvZK96HR/xMQRbXseZ/lTZHYVHPL/jmfxUY+hYlOkLGgxTV/5ourQQI8IN6X/zlStzWLCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBi3yKHM; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-649278a69c5so692349d50.3
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 07:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437169; cv=none;
        d=google.com; s=arc-20240605;
        b=JZyc6oKh/ch+gCNXsiI6mUmkhv3xa7XyyQVDfSrCLp/+fxmZtjAGrNHk/A1Dyc1hOX
         PxS5xOgd2CSrAlRA6mhMgv+oRRLoj44YqwCcWEgCR8Eievekg94heDcCIm/I6R0TdCXy
         AXj7BGEBtg37AdHgBccG+jjII10oSewh8Tpr5cTU/i6JK6Dq04OsKIVAW4GumxWEx8Rn
         dpXTS1W6cl9QQITKqoBtDaKKhFTQ8I1xc9FxiljWl0Dp1F1ljXGJ/EmrRp9c61lNO/D1
         VzGOP0z+RvmQ5WUy2K14zlEjE2BYMwUARIuhaSQywf/jpla4PAkmK4NUGVXuiR/z/aX2
         hn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        fh=ZvA4VJLoopLJ8UkYGcpNd/y73RhTdaHnVu2AZxCyrfM=;
        b=SPpmWHlh4kmC7QkU26Mu8FNIZT6IzCv++j/nyOrHAOJXPUs271Tm+Pki3VTMx423Yi
         fgdRibBmvleY1+q5jPnLdHKp6x0dTmi322CgEFfp5xB7lWGK5PzasiX1qSSdarNd/K/9
         YjjgR5NxmXt4mr/nsrdw6huZKT2NEXHjAT3OAVSAUPMI2KQYOkywt7jQN0swWQGOorBT
         vd3CZOg3F5ovO92DufNwo0dmlKXk26F8OsSDo/plxrGKdGmcki3vMi3Bu6liJoNiP126
         vH4DkJIO7XtMnwxC9a3JKmUMM8LUlc73zbnQWJJv22Uv/wPqSt9ShLiWh1FiGDyLB0O1
         CH+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437169; x=1777041969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        b=sBi3yKHM9h844Ly+KOx+fvIaf+4dsUghzidbyM4ZEaUlHOB/xrr0jOEf5sZ0q/xh2n
         K9MTQm7xwgZ4H3dCmDPTzTOdBU5J03hhD72CUfdMQr8kV9V4ILzl+izOQDcJERXJs0f3
         gwOpLDXMmTPlASBwnddFR6uRYZaKrhIB/lDldRZpHOWnEngf6d3euASDytqhPrLjCXdy
         xXeny/k/t70DL5gBOIeE/GDgBWk1FY2SY73KpWqpsHkT3txvaW6N9sHL70cYZPkdgMvy
         PWbcHiNuvsC9Wdskjvh0kjE8BCE5/KblLSFOOpvsDYjL2/WNMd3q2ZqsLXCdVBAlGou/
         e/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437169; x=1777041969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNahY4MiwxVqosOPD1r6Ht6ChWD1OybSoX+8ojWb8eU=;
        b=OU9AyegLT1/Uoq9bX8pPW/5U6u1crzOpjiAd8oQU51w6EB2jef4Ja4M7OwNadSFFaU
         Kix7FYNh+Emj0P0/uIIb3Va0yRsTqccxIa3KmpLfm1YoNftMnq4zN59JWDDevE37UY55
         dHO73JNrqrrH6h/ZsqarZ4wG5desk4yyQyKarp2S2zRsORrU9yY1qwUSjlyADFjhzoh1
         iJhwKwNi3KIhXpUiKglHTCnEIxqG8qCzLSNJTTeu1CovgizE18BaxPOn007mYxJrQkXa
         Ph1flqzWyWhM4Pm+ZLKFjbi0kx4Xe5FMdSHP9zatrTKeMYdiZ5W+78j8htHWWAmzy5nU
         41DA==
X-Forwarded-Encrypted: i=1; AFNElJ/NjQLqMxY0djyi5ZVNVIva3pHSKlSYFGDE3YU62MIxKnAorWv3NRW61IZZbJYWHyL8CIFOsIK3t9Xe@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7Rx6RC5nCcp3B2J8Aerfw9g2Df9uBSnEGOpS02cD7TumjjRF
	gvZqUS51dY3PqXZpDVGDRx87Qw1Eq7u3vabUD/SyFBLfdtYLuiStHfCUrM6g07zWdcF5/z16nFf
	XLzuNl3xAcJFgOAFNqRkr+MndFK+mvM4=
X-Gm-Gg: AeBDieviLjS7LXi1ah2nNFpAZGnfhwxltbu1lk0UEIEzbq7VA5vwjgY3/nxonhAUa0T
	D/okLAHBk0ZAv9sbLNsFK2ey/QlMCoAjnw9XqUqtsTGwt2B3h6MqXBTVl8cY6qjPChcxKg5haWp
	V59bRZif+zRs+XhpBxSkQ7HWvnyyfF29Xh/2sBrpLTBjynOlS6f/1WwzAn3YLAb9Pi55czIGUi9
	6VZTP3hHAp7xmYsnjUr0IfOMW3eCezRWL8ZkHSb1LsrKLY+v0lY5O9kaa+dTFowWxwFEpDQzhXl
	1ovCiahgaxSCfisb5mzc
X-Received: by 2002:a05:690e:4802:b0:651:c39b:b497 with SMTP id
 956f58d0204a3-653107f6464mr2123646d50.4.1776437168363; Fri, 17 Apr 2026
 07:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417023602.112359-1-m32285159@gmail.com> <aeI9ZDPoP0apY92N@stanley.mountain>
In-Reply-To: <aeI9ZDPoP0apY92N@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 17 Apr 2026 09:45:56 -0500
X-Gm-Features: AQROBzD39EPbUfww4XoeUzc48s7f2OZh1t5AB_xmMPma3dfpJGLEo5d5iY1VXS8
Message-ID: <CAKqfh0Egdye9BTi=DyUMEGHjGdCxh+rpry4++U3PPVu+LF=Tyw@mail.gmail.com>
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
To: Dan Carpenter <error27@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14190-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7443B41C39B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 9:02=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> Generally, outside of staging, you just go along with whatever the
> original author wanted.  They did the work after all, so they get to
> decide.

Sorry about that, still figuring out the workflow. I agree, the way they
did this is...interesting, to say the least, but if I try this again I'll d=
rop
the extern move.

> This patch removes the declaration in __cvmx_cmd_queue_state_ptr() but
> leaves it in __cvmx_cmd_queue_get_state().  We definitely can't do that.
> And we can't mix this in with a remove typedefs patch.

Thanks for pointing that out, I must've missed it. If I try again I'll
fix it but given that this is mips and this stuff is usually for staging,
it's going to be unlikely unless a maintainer wants it.

thanks,
maxwell

