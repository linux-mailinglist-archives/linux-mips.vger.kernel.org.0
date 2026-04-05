Return-Path: <linux-mips+bounces-14056-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB23Bq7l0mlecAcAu9opvQ
	(envelope-from <linux-mips+bounces-14056-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 00:43:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A003A005B
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 00:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84B7E30028EB
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 22:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6982D8DDB;
	Sun,  5 Apr 2026 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L93LHDLe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEE146D5A
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 22:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775429034; cv=none; b=ay1pTN1DiQc/QIeNXd7ce2aFcPtx65U/2vjjGABvS1a3cpKuhqZ5OT2LFjH5EbVZpJXf84EZ1/iAq3rXtwxA/MO7+exBeWEMkhoKGAkLHIEpu9K95caUSLh2gBj7+Zcg/rcw8ryV3RN9jeDlBGHNPvufbSwoDSvVnmt/K0ay7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775429034; c=relaxed/simple;
	bh=zzMy5NtaL7AD5tUyCQ9LrBMAHeKvVDbZmilsbp1EV5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGhlnzdIBHyzp6JOezgoGXf/nVKmQ+VomCiw60z7d3QMWlPvJ5jhWclsXjryENKZPeHdi8DVTzLzYCq9LYqYUd+V/Zeou6lD7JlpBJQNjn1idtk5/ecI93ntXwLi3n+x8F26ahYA8r+QGi1GAiaovaE9Igty9QJwAQYxU4L83uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L93LHDLe; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b97f9587e6eso457536966b.3
        for <linux-mips@vger.kernel.org>; Sun, 05 Apr 2026 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775429028; x=1776033828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=L93LHDLehlEweEzujCeptSsZMXfxTW1A8pWehNu4LpuKx9v9C+/9HCfCH3W3jZt5IZ
         s8OHsf3eH/iNEdMeohly5a1Oc60/UgLH8r35OiFS25xCubk4MuEnDUa1/BAmL+8JGkdS
         UHeWjzXFCkXv5TJdA/XJhnJbEQ+L5W4BJQgQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775429028; x=1776033828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jzjlDiAhhtCwD9FkXK7yFaosCzkOtMCSogVYlSJljQY=;
        b=HAfuJjsMlVcTA57Kb2vj3MzcQbgPGca7LjVFVnrVKLbEkWQ74+bYEyv/tmzHr2qF57
         yenPDD2SPTIMN8W1kXzyHvN3HUHSheKwyNbmaM9bfzEg7//SLXJgTspINIqXDQfEbUCY
         RFw6R/szKYw4yN3DgLnUO5kRJKzoqqD38OnOWNnrXk43JEqpZxrnjbgpashAqWoKXsfr
         LX4yKg9qAdt5WkbVtSq9VgiR2BUTTpDWyndXY8ryT5DmbaBQTqYTEcxA32CnBAcQko+k
         wf3u4A5nGUs27lymiq1uiTRUy7eRzqbwi/YJTg7A00nZObtbt0N4ABK7oVv6DESSkg2a
         GfmA==
X-Forwarded-Encrypted: i=1; AJvYcCXLpjSOjjvt1eBsunrlHaW+Ui6974LCMKRpQddDoKdNUB0yM5tqD2R4eWKUy3RhD2iDd5LgPKDPtEGO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyye/FkgOFz+KdkLvMt4QQeat+xXP90JtDPXY+VyrEppoxzkXsS
	oBuShSBYOWwMs3O8+Hn4C/tX2ooB2/M+EVPuBceMkOtm8X/fkdxW2jkgTm5OUGw6p0lVhPxXgsK
	YvwR/XQ==
X-Gm-Gg: AeBDieu5yYJ2OZHsnH35qsMveN/s3TfdRFVxhXiYK7wNAv3CVvWNAHp3OVul920uJ+P
	zVNPFAPi8lZxtaLPyNV0Al+JGzkxeDa4vtHKaemc3rEg932wMveaBYrHOA7K6zvH8BXBs1cm70f
	EKG/sDgVQzQVQYwoqoAYZLgRvGowPfOF3c28bC73TpxR0EpXtvTW2VJBJlsVouCUp4iTE+aa+SX
	SKZFcm+0ub64QTrX0zG9UGCgz7rSer+uU+Kh972KQVUKqTVOl8EDB3ikm1Pk0OIT5OMnaWnfhMY
	cuxe3DFNMDlxK0XVygzDulb7evdQ3c/E3E/1W5jq303ax3VqQf04Afa2hCyaBZHZL5ODwTr4Fgq
	dkAoqw6h4ayuhtplqq23EL2o2HA/zb8OYkTXEOzVcRiPmpYOyDAEqNW6PyYWt9OVovQZVR34/v3
	Dr1bUT09ZJw64R6icrpTOWdH1I8Lfyt3Inwwj9Mqt9qNdeP+ULbE1Uonjtv4zryQ==
X-Received: by 2002:a17:907:1903:b0:b95:894b:46e4 with SMTP id a640c23a62f3a-b9c679adcccmr537561166b.34.1775429027821;
        Sun, 05 Apr 2026 15:43:47 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm423790266b.53.2026.04.05.15.43.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:43:47 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so1992584f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 05 Apr 2026 15:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU62tWi+kteDEfkV0GMpKwXJlIHGB+1vJ76TyRO5ayBQc+p9+S4CAjLz+EKLlfwd1ROTynJRVPEcOxX@vger.kernel.org
X-Received: by 2002:a5d:5889:0:b0:43b:47ee:4586 with SMTP id
 ffacd0b85a97d-43d292d34e1mr14051064f8f.29.1775429026066; Sun, 05 Apr 2026
 15:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org> <2026040539-sponge-publisher-2b42@gregkh>
In-Reply-To: <2026040539-sponge-publisher-2b42@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:43:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
X-Gm-Features: AQROBzBHjVedWun0AWH98b5RajBbraAAaRvLQSenEhaNEY8p1Czch8mAczvPiQQ
Message-ID: <CAD=FV=X6DRHV6k7G=p5Mno22na75G-69F-EzMkisSxMoxuvJcQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] driver core: Fix some race conditions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Frank.Li@kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, alex@ghiti.fr, alexander.stein@ew.tq-group.com, 
	andre.przywara@arm.com, andrew@codeconstruct.com.au, andrew@lunn.ch, 
	andriy.shevchenko@linux.intel.com, aou@eecs.berkeley.edu, ardb@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, broonie@kernel.org, 
	catalin.marinas@arm.com, chleroy@kernel.org, davem@davemloft.net, 
	david@kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	driver-core@lists.linux.dev, gbatra@linux.ibm.com, 
	gregory.clement@bootlin.com, hkallweit1@gmail.com, iommu@lists.linux.dev, 
	jirislaby@kernel.org, joel@jms.id.au, joro@8bytes.org, kees@kernel.org, 
	kevin.brodsky@arm.com, kuba@kernel.org, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux@armlinux.org.uk, 
	linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com, maddy@linux.ibm.com, 
	mani@kernel.org, maz@kernel.org, miko.lenczewski@arm.com, mpe@ellerman.id.au, 
	netdev@vger.kernel.org, npiggin@gmail.com, osalvador@suse.de, 
	oupton@kernel.org, pabeni@redhat.com, palmer@dabbelt.com, 
	peter.ujfalusi@gmail.com, peterz@infradead.org, pjw@kernel.org, 
	robh@kernel.org, sebastian.hesselbarth@gmail.com, tglx@kernel.org, 
	tsbogend@alpha.franken.de, vgupta@kernel.org, vkoul@kernel.org, 
	will@kernel.org, willy@infradead.org, yangyicong@hisilicon.com, 
	yeoreum.yun@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,rowland.harvard.edu,lst.de,google.com,intel.com,ozlabs.ru,arm.com,linux-foundation.org,ziepe.ca,ghiti.fr,ew.tq-group.com,codeconstruct.com.au,lunn.ch,linux.intel.com,eecs.berkeley.edu,davemloft.net,vger.kernel.org,lists.linux.dev,linux.ibm.com,bootlin.com,gmail.com,jms.id.au,8bytes.org,lists.infradead.org,lists.ozlabs.org,kvack.org,armlinux.org.uk,samsung.com,ellerman.id.au,suse.de,redhat.com,dabbelt.com,infradead.org,alpha.franken.de,hisilicon.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14056-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim]
X-Rspamd-Queue-Id: 68A003A005B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Sat, Apr 4, 2026 at 10:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 03, 2026 at 05:04:54PM -0700, Douglas Anderson wrote:
> > NOTE: one potentially "controversial" choice I made in some patches
> > was to always reserve a flag ID even if a flag is only used under
> > certain CONFIG_ settings. This is a change from how things were
> > before. Keeping the numbering consistent and allowing easy
> > compile-testing of both CONFIG settings seemed worth it, especially
> > since it won't take up any extra space until we've added a lot more
> > flags.
>
> Nah, this is fine, I don't see any problems with this as the original
> code kind of was doing the same thing with the "hole" in the structure
> if those options were not enabled.
>
> > I only marked the first patch as a "Fix" since it is the only one
> > fixing observed problems. Other patches could be considered fixes too
> > if folks want.
> >
> > I tested the first patch in the series backported to kernel 6.6 on the
> > Pixel phone that was experiencing the race. I added extra printouts to
> > make sure that the problem was hitting / addressed. The rest of the
> > patches are tested with allmodconfig with arm32, arm64, ppc, and
> > x86. I boot tested on an arm64 Chromebook running mainline.
>
> I'm guessing your tests passed?  :)

Yup, all the tests that I've run have passed. I also threw in an
"allnoconfig" compile test just for good measure.


> Anyway, this looks great, unless there are any objections, other than
> the "needs to be undefined", which a follow-on patch can handle, I'll
> queue them up next week for 7.1-rc1.

Thanks. As per the other thread, I'm happy if you or Danilo want to
apply it, and I'm happy if you want to make minor fixups when
applying.

When I see the patches applied, I'll send a followup patch to address
the "needs to be undefined" comment, unless Danilo makes that change
himself when applying.

-Doug

