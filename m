Return-Path: <linux-mips+bounces-6896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A31159E6869
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 09:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A22C169B0C
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 08:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7831D935A;
	Fri,  6 Dec 2024 08:03:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C68328B6;
	Fri,  6 Dec 2024 08:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733472231; cv=none; b=lfM82Qeq+p9pQ4Gflq8gTYTlbS8mKD70fehQP3fSx9o9d+NjCBxT23IR6RjgvA67LnV8mxPGU4E/VeDVKfXbpCY9S5z9bORUAjjFDYzeXBwL0wtuS++GKjTHXPcg9dZ2jUW0B2ZXi9hyc0q2fFPIUzxMTXLhaojdxDN5zwyjRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733472231; c=relaxed/simple;
	bh=0pui/o/1awda/GGBn1ZXioNMj5BKH3YWvyNeZDPK8OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/CZy1hlpONH1CDk1VBcmTyIbEkYMURBlKagBDwnzoBdk446/W8YexdIjjAayzOl5Mc3tRp+QpAcVNe9+xtqfHTQjBz5X5ERfMKc5IpXtfoOoQ2YRwLkZSF4+Yi33dCh44EVhO3P1M2QTwlCrbmKEUAKdwItsdqH25gsA1YfL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-515e33c62b0so452442e0c.0;
        Fri, 06 Dec 2024 00:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733472226; x=1734077026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLKgpSdnNg5SHTYD6Gi2Z/t/cQJUvGV7WPvAx4ESg4w=;
        b=F1E0x4PLO88Wz8h8/Mfu8/W3yLIyqH62aTYOZJPFzifPt69hTbPnzBy/5IcEkBSnOC
         F3jS+SA9hlEPx27G+Jh0noKY/ETBMsgjzZ5kVoaQQLGF5oiM1l2gFRkWjg4NTYvXX9fg
         D1rMelsbUPGu0bDcmpHw6lDlwDL75GMvIxyKFDECV+dUgkvIZBLVMbdq6bOXuq8YyBw3
         yK4Rr98nqipcRv5FhlUuI2kyUZi2bwWqORRaYiylPHbC7JGCo1XOFFXlFMWirVIv/siF
         jB860gCWayEQTgVXxblV243BLO60iqmoZKK1aj/bw0py/I8qEeE/pa6EAVUp75mCv1La
         tkTw==
X-Forwarded-Encrypted: i=1; AJvYcCVbu6NEOyY7Y7zGQXhAX0Le9bB27rByYtl47BDv4bP9GgPPuHzMdKTX0CBqTR+TbEfd4ayrPN28Rq3IgfI=@vger.kernel.org, AJvYcCX4eZBln685yaW381oF8uVUmnkC9cPKtoIEqA6awCARKFwmCRMwsWoewgYA5EN1gFyxS+YVzm2pp7bYag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEdRuxoAPN2mdD9dHareFd4X+vMFNWRCFowgKr3QrbxWEIbhE
	AjbSoDj7iujfMjjIPg7vtmNRtHIwGCQGhqtuGmUFkFEZk+xROZeiDqm+kiTr
X-Gm-Gg: ASbGncu+U45jPWFMMZp68ikBDlZ7NSw9SO2wBWCXonNgEk7j+oX3yOYkQA1UOZU/7dd
	J3GF4f28j9vSRGo4jHF9UAZajKQDZfBZfdJyV4uq6AWz7WW2iaQoVGYjsC6HIuCO7il0lulhNiW
	1zvsW4J8Pjo0KsuK/lOJ3nz8F6XEEcsFK2R4WQQQ33mCoa27Ll1pWaxFzZPvY9qRaE+FaJbI0rG
	TNvkEZmTl4D5DO+rBY16hs467/0Nm4hlqDFARcs5yT8Q5+RLAfztK+/vBdFXlGbIuxYIqYL5y3l
	n2JQY9l8er9i
X-Google-Smtp-Source: AGHT+IH90GkgwWchYjVPEyG/HSDVMAcbYDHJ9VR7iw9/htxmB63fzRRXydQU8L+3NFeRIxT/9NWFVQ==
X-Received: by 2002:a05:6122:1d0b:b0:515:e6e6:d8ae with SMTP id 71dfb90a1353d-515fcabf9b2mr2165736e0c.9.1733472226033;
        Fri, 06 Dec 2024 00:03:46 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae16d52sm259482e0c.2.2024.12.06.00.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 00:03:45 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afd56903b7so21583137.1;
        Fri, 06 Dec 2024 00:03:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEtC3RYW5cbcycS0jcBQefHysWHDtJqIKuzYfLTZlVl0Huc1OTMM9fxTPSrZ8fFAozRmLoGDmAeVBM8+8=@vger.kernel.org, AJvYcCVQwmrzLN9ZL+z2WmSGf23BsyzOydTPP91zmEY5NW3O+Eff0TCNXDxGOR/Tj1WIgGP8ORD6tSdb3Gw0jg==@vger.kernel.org
X-Received: by 2002:a05:6102:304d:b0:4af:4945:9a0b with SMTP id
 ada2fe7eead31-4afcaa23ac8mr2135639137.5.1733472224382; Fri, 06 Dec 2024
 00:03:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com> <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com> <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <09B2AB6A-B122-4287-B97E-F800E511097E@nvidia.com> <995E365D-5B83-41B3-A46C-6493D203A761@nvidia.com>
 <CAMuHMdW4=HScVk2C+vkG_JqO9uMCF2VoJTuGqSi1-H=86e2RqQ@mail.gmail.com>
 <056a2305-db07-4168-868b-164493ff8587@redhat.com> <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
In-Reply-To: <F3805AF4-1660-4CEA-868E-2D1F4A70BCB3@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 09:03:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2-dTkRcDJGszH7cuZCDO-ZSq4n50R9-+p2s9=P5AzKA@mail.gmail.com>
Message-ID: <CAMuHMdX2-dTkRcDJGszH7cuZCDO-ZSq4n50R9-+p2s9=P5AzKA@mail.gmail.com>
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, John Hubbard <jhubbard@nvidia.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Thu, Dec 5, 2024 at 5:05=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> Is it possible to run a 32bit kernel with HIGHMEM and
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON on the machine (of course with my patch
> reverted)? Just to check my reasoning below.

While I can boot 32-bit kernels, CPU_TX49XX and MACH_TX49XX do not
select CPU_SUPPORTS_HIGHMEM resp. SYS_SUPPORTS_HIGHMEM, and thus
HIGHMEM is not supported.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

