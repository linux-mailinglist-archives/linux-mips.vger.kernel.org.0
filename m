Return-Path: <linux-mips+bounces-15113-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGyYAaGSMWpjnAUAu9opvQ
	(envelope-from <linux-mips+bounces-15113-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 20:14:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B5693F31
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 20:14:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rAnxvk94;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15113-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15113-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57D4830A2080
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 18:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755563D47CE;
	Tue, 16 Jun 2026 18:13:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F33D5656
	for <linux-mips@vger.kernel.org>; Tue, 16 Jun 2026 18:13:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633633; cv=pass; b=Ki0qTYrsRQAPNaqQnG3DtfcroQ6+vKsrIzZPpJKuinBTTmtgpN6SKxGE0wRNmlmlZ+3qzkJcyLWk8yQcm2tvB000AsGxPU+voCdYrMlgdNj1vV+ydLIYrbcfpIqhb1QQZRQZcQYBag+qie1FGv28WIX/JFFJI3IJpA49ykf0DTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633633; c=relaxed/simple;
	bh=XVDXOs5PD1K5upzQNmkXI9UANSCojiYwT2l1mSGO/eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5m+3upnZp67CKIy+yDCeuXw2WO8DkbzsFF3zZmPG4rOqkZPA232WCjqJueOilzchlOhKbCaWq2djmghhNOOIjplbJUwg4IdwxE3UTpUV8/Iq0OVM30gel4Xxw2xmy2fCvSqpCnJJEiXwkiCjWM7gOJZFJ7CwFGUMYSOUnyeb/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAnxvk94; arc=pass smtp.client-ip=74.125.224.44
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660e9ff0587so2117117d50.0
        for <linux-mips@vger.kernel.org>; Tue, 16 Jun 2026 11:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781633631; cv=none;
        d=google.com; s=arc-20240605;
        b=ejSmsW3HdJsIsQ+izMlWG6aZWGJxZEwYgbA/YAP+dkze2ayQFJ4GdTGZEAvPKnUiZC
         8ZnRC6Kzjm7/j9tJTdxs0hsQC/XUu7FCR4UteIWFHPKs/xIO/aA37t6DmdiyIhO6Ldpc
         1O6Gha6yezEmebmXcM6WX3YhtOlPkc5zNZEMt6Qc/D/FMT9DsHhRZ59vCDY16dUNif27
         dm/glvfT6gS+GwP1U0PLnS0lHvtP5Y2MWbY23LK+0OPKCdsvAvXBonocVYdMc80XmRmX
         OgeW3OWzuHr51FTlt3tcXf2D3YoB2ssZ3atcM6FePm7KJhCfC0rnSPdZYKF9Vnr9SnzE
         V6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        fh=Q+6lv1M3x2LXi+YhQFQNeh/ge4KlXXxn4bpVhuJFqnc=;
        b=X0xGfRsGDolpawYuhdADUQ/GI5Csuo+tuwWPXCD6TAqP9oZkNcQC8sNydsku1Mos7b
         PbbzBeV7FTcDebFoampEgSzTPwrNXEkRQhHmCF3zd75CKw6b3AhcyYXWKrgEIbBU2w4g
         8F3ALqwWRI/P0jPDri0UkqdevVfLz820h14PYeeCPnt+P7XlgDKH46E2TYWW/jQWIYv3
         a6nLBRJknNEijQMRKh/32FBHGn6H9JMlJA5adM1RB0kYx1BUw9ZMUA9tPNsEVpTMbha2
         wJaVaRS79u6Dgu7Ti2G9mqk527LAfV07RVddBBnJ/oTnpgRtZNAAFq/wCgaYOiK+LRB4
         dFUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781633631; x=1782238431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=rAnxvk947cvJ8ukLbiBKxhRl+YNdBW7Y02O9Zulprv2+8noCPttVhKT2baOBLMvEK5
         lvsHgOwNJ9PJhCoIYlRDESOCtoA/qBh4TomXhxtNyzQFaQonFC2UHlD3CLdOC9N54VAf
         qfk+PKjzZ0747AaH5uE/2cXPWPOh9RYfipXOtvJWsnusbs6Bw1tW1lsuCLCziJqgcc5Q
         WuiqaO8toIjAtVd8C4lTYrq8sgyXM3EXR0RuEcHUQxSbNmjpbbZSP4/Wg39oAUF0nnVO
         NX7CIqNty/AEFmOl8Q8iDi+SyIGQgwmGn3QdtlJtGcqAvDWaR4X5WdLEYvJJaMrmj7Nu
         R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633631; x=1782238431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAuGRKuOlDbkCJf/rcFDQnFKbzVCieXn0KWbIFna+U4=;
        b=HzkO6WBIkYDhjbV9+VOT/nBAksTb6vv/wfpVOT5VcjJptRFf43CaQSCKlx3797JUT3
         1LR5ltYR6fE0Ypeahha0pMJsOHaeOI/NRyAmRoUTrTgNWzKV/wdW4Gp8A2a9iA1XhMGd
         hM1EAmbWBqcVqPzTbpVnWkygcB6J4ckpcr2Tz7ZVT2uxZnChtMp3v987xfzhuWntdDJq
         oiH66UQlLThY9vcmzE2jjmeEF4PXPDW13U/vkgp6rixJEi72/lHS2B6/Mm4l+rXQAZ4U
         eTDpelQjv7kPYRj4Y3PKUF5ST1xwSkMPn4eC0z2BEIk5J+fA9v3ZCPvy5Jjek034ythD
         l6dA==
X-Forwarded-Encrypted: i=1; AFNElJ+QGFOiV5c5LOVw0Sb6hXKXApgScjsLlJ5oQ9S7XCeV64gTOAXT7KutIYFFj7/uAPj0MMezEhqUNPXZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwaIrLRRRudKXIxIJTeG8yz/3QHKL1RojZIp1m8IPHDf0nsyiWP
	zKpXwF51BEiN5ozaBSKPtkHUAJ+IthsXG4QA3MN71hkkLT9Wyg7KIdFPUTNC57Y1Kr+JHiKvWJe
	+oo4v+bIKZTP2L3Cs0IORqVTBDLVAVuA=
X-Gm-Gg: AfdE7ck0kgs+RemEVx6ljYQs4a4TSORKlY89kaX9D8QZBgWWNulqTRoiusyAj7fg9sH
	UBA3WF0HqplnRTIsj0fOSrQxNVuSnZBxGYWy6FHB/mmqilCm6AVrQ5M7yMPpcPXNvoLEdxOB47j
	z8KN5wVwff2abQwK+kTVkRpC738C+aZDWVop8CHxQuXLmz4JhDtmiYO361HtaE4NA9wdIuUdBLT
	+GHYNdN3yq/WBxVHRMMUHRnYzUuUdCCZjluuUa8yjJj3tN1EyOEzO4qmoBpGyDBJAzYF5trm562
	+AUT
X-Received: by 2002:a05:690e:1446:b0:662:b875:b149 with SMTP id
 956f58d0204a3-662cb9a5521mr488948d50.28.1781633631026; Tue, 16 Jun 2026
 11:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
 <20260614161503.2219681-2-ekffu200098@gmail.com> <20260616131945.GA2236977-robh@kernel.org>
In-Reply-To: <20260616131945.GA2236977-robh@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Wed, 17 Jun 2026 03:13:38 +0900
X-Gm-Features: AVVi8CfDQJdb4Q9jLQYUPY3KXB7WpMZ-iKjsv1-5FCLStEz_WwunrIBu4QHvpOQ
Message-ID: <CABFDxMGYTP4uLaH-ew+zf4++CtPY54+pDsRVO6TbC9W5nVVtBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation success message
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	devicetree@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15113-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:saravanak@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekffu200098@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 978B5693F31

On Tue, Jun 16, 2026 at 10:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Jun 15, 2026 at 01:15:01AM +0900, Sang-Heon Jeon wrote:
> > fdt_reserve_elfcorehdr() does not check the return value of
> > memblock_reserve(), so a success message is falsely printed when the
> > reservation fails.
> >
> > Check the return value and warn on failure instead.
> >
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> >  drivers/of/fdt.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 26f66046cc32..d985c07d7c5c 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
> >               return;
> >       }
> >
> > -     memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > +     if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
> > +             pr_warn("Failed to reserve memory for elfcorehdr\n");
>
> I would think memblock_reserve() should always succeed and if not it
> should print a message rather than having every caller print a message.

Thanks for reviewing, Rob.

You're right. After taking a closer look, memblock_reserve() either
succeeds or panics before memblock_allow_resize() called.
So the check that I added in this patchset is totally unreachable.

Please drop this patchset. I'll be more careful when sending patches next t=
ime.

> Rob

Best Regards,
Sang-Heon Jeon

