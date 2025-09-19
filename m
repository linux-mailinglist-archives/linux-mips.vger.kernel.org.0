Return-Path: <linux-mips+bounces-11524-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4DB88229
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 09:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8223D17159A
	for <lists+linux-mips@lfdr.de>; Fri, 19 Sep 2025 07:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D632C0266;
	Fri, 19 Sep 2025 07:17:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3570275112
	for <linux-mips@vger.kernel.org>; Fri, 19 Sep 2025 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266276; cv=none; b=uRgNZEUHOXht7MFOI2le6XTQxV6v/n9EnlAbzyG7bSkA1eHvJYlBW5Rn2jaaB9KfYCH/G55UbB7pHs8FYsAyMTna4Re0maIob0VSJ4/ElVZ/QnGi5811/dty3HhHCn2F8UQ/DXDhoyMrR8riIXmtE6EBJG1lZO7RkvkCfXK23I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266276; c=relaxed/simple;
	bh=wb2qdIEva+9wMnDjLkyVGNO79u5HZMke8qdhK9b51SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dduFCNJTpKMD+mLTgvD+kuK/mC4qZJonR02QgBjYJ0P5KFd8pIYu9PA0zMzTGph4dewwwqAjyTswxQVQUuY/I/pzqGU7Gd20EWMnHpcbYY7gt9b2ovJgGSPWUdP6vulvYHReWZYUskyZt0qwfs0VhSPkQzIE2P6+IKrjB50qyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-545df2bb95dso739030e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 19 Sep 2025 00:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266272; x=1758871072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
        b=PtuU9pZ4zPduqvlDnTG2LWRFcLoa2NtEu3vmTqSzyn57uFolJVPhN4UJ9pcWsVW7Rg
         KYk88C5YWnvSI71pu9o0GG1g7jxIRN7t3v1eOXaPIvGcUTeo/X03IZ+A4/+NR/fqgHkT
         ZoPkh/Fneqxk5V73m7nCUGzunrBDxtK0aXvbqqr0NaNHdyPlVeghdEH901yLgplynoeQ
         AYPl+MyHsis8Z/mplBH6iTn2ljJ8opPEYjYmYqANTq+1krDB0PubJOA7pMX4+msyys3N
         rAB+iZgpwkkxinP93hfvuWMWV5Qcd19YT8BBERHyA+U3yA3MbAHyJO+FeBk/gp3cXJA7
         GaHg==
X-Forwarded-Encrypted: i=1; AJvYcCWcfpbBthaSi/ZpoeOAoFlhOV4rce8fZ+XPkOp2YyqtVWA9VbQ30xutxfRDNvC3Wcvi0YaqnUp85895@vger.kernel.org
X-Gm-Message-State: AOJu0YwJRxjeFW/iimmaG41s/BWz+RublJNJyjGsSQWyBHS3/6Mbobl2
	VVmepdsIpKTIWSN7jjX4Ua6aGL1MeZST2uCLN/UCNaJanmM4giNNgyOzBMPMO+h0
X-Gm-Gg: ASbGnctIhEY3+XGnVk9K+wSdcligGXj8UHGlo6sGuFgLtvmN19mAyuDh1XOUg+MC05d
	CQwbkDOkxV9xbt4qtgPH6Y74Wxb6T7joO5rXQzwoWjDaYqAceP/DKepBntweD/SG1SBaDKxvSy7
	tTa02G8MRqZDZDmmmU7OSbnc9dg+ieJZ/r5JLv7ouV34uBc5njTFU6O1x1MFnQ1+uHQN6oqMIca
	pjMnHHylqEImml4trAhPQffWQlFY98rxkxHrfABfXWlFZru5eJddSWAfev00UO1IqbZwL5oceHU
	zAjDcxxFrzeg7hTvtpslDi90vvSsYdZkUMxRt5tXVUVKHa6kWGJGvGL3rHK7iKl5S3a3I22eS4K
	YPo49/oLp7ES9jqU2SavO90kuDQWLV2d079crQd4fLmPYU4raHqnzHzhO6i8g0wU7Zfz3ftg=
X-Google-Smtp-Source: AGHT+IELb9GPs67fcp8Kxn3+mPQckapbAxA1Y4ngCO1pGx0/hQvKxDZY6YDrNRLhYJeeuLi6edLNOA==
X-Received: by 2002:a05:6102:3e1d:b0:521:57e7:3b19 with SMTP id ada2fe7eead31-588f3c01d6emr638033137.25.1758266272494;
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e81d8sm752306241.4.2025.09.19.00.17.52
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5910f37bdffso14581137.1
        for <linux-mips@vger.kernel.org>; Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH8XJImCy6JFjJTflRrPDU0ibfpNWVuCZV/Rs7hNmTTX7Vvy5GgOlK4h4crz7Rtf3OerQgg31s5kdq@vger.kernel.org
X-Received: by 2002:a05:6102:534c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-588f3357b74mr639278137.23.1758266271934; Fri, 19 Sep 2025
 00:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
X-Gm-Features: AS18NWAI1tRNfDFQjIFUy24j2rmv5VjIZdZQpBy05JHeqlSMB-7iVf4odZQDlmM
Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> >
> >> I'm still collecting information about which of the remaining highmem
> >> users plan to keep updating their kernels and for what reason.
> >
> > On this topic of removing some parts of highmem, can we say goodbye to
> > kmap_high_get()? Only ARM uses it and only for
> > !cache_is_vipt_nonaliasing() systems.
>
> Good idea. I think we are almost there, just need to verify that
> there is actually no impact for existing users. I already knew
> that there is very little highmem usage on ARMv6 and earlier, but
> I tried to recheck all platforms that might be affected:

> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>   get kernel updates, and the only one I can think of with
>   DDR3 support, but seems to be limited to 256MB total memory.

Are they limited to DDR3?

IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
new variants of old SoCs, to accommodate the changing DDR landscape
and market.  So perhaps they also accept larger RAM sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

