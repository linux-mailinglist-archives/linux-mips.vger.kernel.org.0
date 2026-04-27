Return-Path: <linux-mips+bounces-14329-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0COQAzTq7mnZ0QAAu9opvQ
	(envelope-from <linux-mips+bounces-14329-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 06:46:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893CB46D0D8
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 06:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B36930067A5
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 04:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7392BCF46;
	Mon, 27 Apr 2026 04:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diEKY3MR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC61AAE28
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 04:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777265201; cv=pass; b=o2fZbytAJFPeU7PqaxPmfBQRlFdRvJk2bZuVdSi+fH7MVlBB41i6mFwf1ORYT/of5ozZnVQsfrazREpXHYpF1tFDRFodl/pK0DL1QjHRg/AvDDSnAw1hljVYuZWlEymc6MSOMg1pQcCtu7eCoeMGhS+baKRIdi/cgBsQxnzabNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777265201; c=relaxed/simple;
	bh=5JZeRFDKCCj0UXOmMlU58MYFaRDR7tjOdPKJxFgpsH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUvMcurNtDLdPVlaTGUKqDUVA9d8RKpyafqSRy66YaY5ki0H0Q6mD0kkNDoQ5zuKnqEtjg50xTe7r2rr7ZXxVY/+NB3kinhKNxGAtOfzgMdjKhtkHeQ7Kkj5X/yniumz+vBRI+f2P78cjX9nA72VpXf3mPnEdEQE0JuDJCTXLtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diEKY3MR; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-651bc8f864fso5234961d50.1
        for <linux-mips@vger.kernel.org>; Sun, 26 Apr 2026 21:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777265199; cv=none;
        d=google.com; s=arc-20240605;
        b=Cm4ccFcACV3qT9sN825+T75o+WZRx3WIWAxZMVBqeefWX+B5gpCMPGAWjaN4xaldIr
         viwsoOcyD4iqpfm/locLbmdoBTSqFpsxfUjQzxjKpJyfflO1baO3wyLR52RCj4gjOikJ
         8iV6e3hfGmu7N608n2NXyRv8UD3qXEfYeXmMoTGU2rraVlU4Udo01gSqPJUF9WRN3gMb
         3bP0JPmsXEU6acwXmi0yVaaNDxZ4evuloe0v9ZtLVEfThgsl2fw/B02JXijAQqtJ69sP
         a2htXlxjPI1YHEI1StAJALBBzFGuDclvx0/kudyV7/qW4rYffzV61PWWZTD5Le/TPisy
         2voQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        fh=cnhNtjgLKKCl3mO0FasZejJB1IoHTovZrBXi47PROas=;
        b=Nl6LZS47PaiJ8/hIbroBZXjvgtRzAX3Cmky6XIK8cfqioUfJftXAPguM6+bi4qVPS5
         +dYAg/xjToLU5U2MWILD8oNbxlTf0JVeYJEz4K/IoodJj3PXzT8+isSDOskAx6ASJazX
         4UVOeBy9uy6ArziaHiXy65nVeVqrPBKrMCqFyzUJGCWF3ylva1sGyHpDJgueo0rCt9er
         N64K/As1EsBbR2RKJqMxASrerMcTORSCAkDgab54qGrmYaIsc0sdOfHoZprZdHOXVtN0
         hwaZDH7OyRZWWhNZy09FA4Ye1wjz98EYh6Soqojukl1WRErqCD2ZY1uvQVDm8fLZarkC
         pKBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777265199; x=1777869999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        b=diEKY3MR2CL1DDHlAdnsU1qLbWzXdQnMVkJK8hvgcSrVdRD3ohPiGV09Wbdt1nnmBm
         UxphheYDMSmXJlL6semxkAxMqFtUleyFRyVOe+o0bpXMTslvbLeDqmUwOJpHLQreeWGp
         RzvE5umQiGz4kjaPaWGCKyN9ZDPeDzFuz2jl4lTT1iPHfm1hUgPZ3MWL9cMjyhTX66TX
         RcdaKc52cNoIBKUTvvMosi5dOAUmL7gMU2sGyNQsdGkV7VTWNOAqVWcWvXkSLTX/jd3N
         GWdIqcDo7mHv0N18t1DBqP7nebmGFS6JQngkT2R2to1+CrYVzqJGwwfuaay8kN6zmwKR
         NHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777265199; x=1777869999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hg00/cHwiPVqI1RE0q+t3jeQslbJkzQrhi3CAPPDlvg=;
        b=Cx8hntPcTDKRdSIYBKqSCnBEmAqjnIDPZLDmUMTtF2L3sdhwFITuYpiqCPNW09FPTJ
         B2lgK5dBhZOSTVzAfwjH4Q5qimIn2x3gyzCTM4c1JUe1Z2idO7I5Bj+Z8Q+DIhdEdMJc
         bKrwrhnCmr5HtevD4yg6UaVdKI4CC1sWo577CCMQo5UmHIAiSocO5uPEv7umuj4Q2bBY
         4z74qy/RVkslb2s7yMjfIINk2gJs/CHqzah+WBra3z0zNxBNSOuw/lR5xKB3n2FXeexw
         Smd5dFr03psxZrvaLQCGZeGUSGDI/OvjWEgr73AOIVmF91cGMW3/DDsNsjrqbqx/0QWC
         ALPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GrvUvhcwhmHRUBJ+oZ5ml4sN9aJcHF1/yyfXtcP8hrqlBst7FGXs0pmgnFWtju6b8RZwkK3QAug7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxUQopaJOFDW49czymIT22piehLcU3FB5zAP36hcBlGjn60b+y/
	dwgjPN58vbcMbLzOTdzIYY1LBAUSQMMf2LAHcKzN6sVSBOhWgzr/DciXaafirSsKmMb9nFSWWHX
	tJgY2ahdQIeeOunr9oRNsMKF2g7U1sg8=
X-Gm-Gg: AeBDiesfij0FIP7M3OFlt/4NPIAhP69wSQyvG1kJc/lpaurIYa1vGEHgar+ccmV8oqU
	dJuaBbl3GgEpbb278F3vtsiFfuJ9MQd5kFYE9a6HmLkigyCoghwa8NINeo/DgeFGdpm14s9IqAq
	HuRRwWSGlLk2hIN/QNbkob1P9Q/hYl8WKKdrkx8SagwOOq0fyzPLzHTw1lCNjkPhEFeQd3+HKN3
	lvLzasptBkmPZ/rKbl8/3FsjprrRChQ4bn40BF/X/t7vc9trNYgNEWSQMJt0H2JRfhQhZozDgen
	mU7/W0cJ5n2BlQ4=
X-Received: by 2002:a05:690c:84:b0:79a:c40d:b701 with SMTP id
 00721157ae682-7b9ecebcf3cmr393988477b3.13.1777265198689; Sun, 26 Apr 2026
 21:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418230344.44242-1-m32285159@gmail.com> <2026042615-ambulance-upright-3041@gregkh>
In-Reply-To: <2026042615-ambulance-upright-3041@gregkh>
From: Maxwell Doose <m32285159@gmail.com>
Date: Sun, 26 Apr 2026 23:46:27 -0500
X-Gm-Features: AVHnY4JYJCJpwaNFhEBEMqRZCuWUjwn5I8y4s2iX74zQEaUutzdg1tyyke-60Wg
Message-ID: <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>
Subject: Re: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef enums
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tsbogend@alpha.franken.de, len.bao@gmx.us, yoelvisoliveros@gmail.com, 
	error27@gmail.com, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 893CB46D0D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14329-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Greg,

On Sun, Apr 26, 2026 at 10:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> How was this tested given that the previous ones all were not?
>

What ended up happening was when I did my test compilation, I'd
forgotten to compile the arch/mips half of the driver. The test bot
obviously then caught that and it ended up being fixed. It's also
important to keep in mind that this is (or was, rather) my first
*ever* patch, I hadn't learned all of the tools of the kernel yet. I'm
almost certain that this revision is sound, as the test bot hasn't
reported any errors or warnings, and Dan Carpenter hasn't asked for
any naming changes.

> Also, this should be one commit per enum, right?  Why not make this a
> patch series?

It /should/, but again, this was my first patch. Obviously for the
future that won't be my excuse again, but I agree now that this should
be a patch series.

Also, I think this v4 will be my last revision of this patch. The
integration between arch/mips and drivers/staging has some serious
friction and I think I need to go focus on the subsystems that I can
actually make positive change in.

best regards,
maxwell

