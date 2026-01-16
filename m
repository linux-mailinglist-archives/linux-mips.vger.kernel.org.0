Return-Path: <linux-mips+bounces-12950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308FD33244
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 16:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5F10300986F
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 15:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946E12D661C;
	Fri, 16 Jan 2026 15:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ToTB5LAW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="prByHzcL"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575B241139
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576483; cv=none; b=hVY5oTWvPCxcJhWzi+jaciA8OM7qDICIiNuiN1A0Cbo5lCAf1gCqigNdncdGUBQBo2PRi7eh+pKgNysvoBHvRo1Q1MpqOtkAjODUBwZHItUbFZs+hlzvrCmgPpELLPn1KAa6e0NWIijzpC2O6Bhn3MteTE7kGNT0nUKned55KvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576483; c=relaxed/simple;
	bh=McpfC188H2CvAHd4+BB7AxJkhXt9KS2RD0jkHVJ/lvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tQrSN769r+LvOwkcB0GoC66z7y54/MKSlju+OvmOkCPvc4nL3eP2sDM4zmo5G/cCz5Q8lZDF501QJKS9JvRdJXApnFaPgFntRLdQpWbOsAUSy2jv9lUEiMM3t5yZoj6GQnSiujdc/KzFxZWCKHv21lu+LxK2AzqznP+8geBS9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ToTB5LAW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=prByHzcL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768576481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXd78tLEXLfNJonJWIYvuTIRR+xmUZ49LsLId8Zx2R0=;
	b=ToTB5LAW5kxxY03h+nbs6OcnG8PvIQeYopA6CvtXB93+NdLNHpdyG1B4DToZAXMGOzUt6m
	1eiH1Lo+Aj8Z/MEDD1uvdbXo8FqlcCxvlKsnDGnWGAIrks1ZoKz1ybvRrngIXV1cfBurXL
	7k46qzJVS+ym0JjdIbF/ai0goYVBpqs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-TQgpE7L5NjCOHqVfvUtdKg-1; Fri, 16 Jan 2026 10:14:39 -0500
X-MC-Unique: TQgpE7L5NjCOHqVfvUtdKg-1
X-Mimecast-MFC-AGG-ID: TQgpE7L5NjCOHqVfvUtdKg_1768576479
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a5bc8c43so335199685a.2
        for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 07:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768576479; x=1769181279; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXd78tLEXLfNJonJWIYvuTIRR+xmUZ49LsLId8Zx2R0=;
        b=prByHzcLsiFntUUxAUX5h5M189VnGyEY7ehOElpQVdMi5/HQGKafJDCC0xJHWz5ME7
         MMZIkMS2NOZ+UtgNv6CFXF/BouDAobZKKeA+tzURKqkObUD1zdIOPNe/MifumuPktnPC
         Fywj3hJrMjYs2292rRE9m/s82En7JreMBCF1ZJ6sjExQRemM61TwcohLMnEbu2ZgsbmE
         2ShjExOHXfGYw4Sb54aSVhBtKWaATTqJNfYtP7slgYxOg8EffDd63yaH0RayC4kagOJd
         1ExB6z8pj5qLbJmCA9IZAadxLs35oykBQlBHSsPZm5a92mpM0U0L4W+K8ceTZSzyVRwW
         mdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576479; x=1769181279;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXd78tLEXLfNJonJWIYvuTIRR+xmUZ49LsLId8Zx2R0=;
        b=YenuQdphxtTGzQpoQCqJRiF8gDoRcUFgto+aP0QU11D0bl8h4DP1BrsIz9irkek7ec
         xnxOan6YBmAaM9EXcUCtx578hAOg0CQd9u9A9TzH5MwAil87M1Dc796qWYbFMJecP9An
         9Y4E3LiTx1rI0NEFJKSbB1hGctN5Hwpesv9CILd50WYex8kszEE8bk86MG+UWN4S7CSn
         Kofsz6gAqFQJh/bpfhRQE5HvzBOZLzgRcj2UOglI0WBDTrbnKEJ13K4LfHgaSCdnl5WY
         8nd5wUWo8mtd4FamIuVSPf2e4zXnkj9dmZLfIdvc93YmKNgGYpDe8wPd3r41IcZmEGjE
         u3pA==
X-Forwarded-Encrypted: i=1; AJvYcCWYMIb7NC7h8FEy2fH4GJN6nAQ89hMkEMILH/2yJMvart+gDPiRDPyFCdmhs28TYDsP1ncngP5Omviy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6GRm7cAbRyktutiqztz+5kuhk0kDtecqs+K8qAK5plgycPM1
	y1ayg/8IU7UFD6DF2pVnsB+Odl+9bp5lzwFP6OXwIjvbIhWWIlEBgYTBHIvHhe0fkVAs/TnUgtB
	j4vXdJV41b+OUv3zSvHu+FRRKLV6VBiHgm2/1NvN0mb8AlPpMGZZhLJomIUE2clDXgK72oX0=
X-Gm-Gg: AY/fxX6zzdj7to3q3vjx1wlbVEa3C0XHQuytBFKjUA/Mlbk8mxJnqYLZGYVVLko4yzq
	L/UBvjUxNoEM8A/KMvL8IBrl+LtsDQhMnf0gaAHAs3KdEChvHLz8K78pc+z60/AeTL5VCf09bJO
	MbMVLlWuFSS5MQzEKAjWm7wWyfU4w3LbVr73UXOPubmAwVkybJOcp70OdXaQDG3vQrvIHQBrAe3
	jxDnvQMPaHodA5NCU8RrcQW7H7WqnxSGMcn457jdVxrftWLrnCWbctqI1kMehFpMZAqRh5buh1A
	CRozhkbCCszbVC9abAHLW6apjQkhbfQ2keumjTYV6dGNxvFtq+BKN+5uwSZySUMQs1LPxn4umWO
	xUxxq0xGRSeG8rNjMCgStsEupT05DyB5+/29rf9GXuBcZ
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr413936185a.61.1768576477912;
        Fri, 16 Jan 2026 07:14:37 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:828:aff4:3c03 with SMTP id af79cd13be357-8c6a6789392mr413932385a.61.1768576477523;
        Fri, 16 Jan 2026 07:14:37 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab272sm256477585a.2.2026.01.16.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:14:36 -0800 (PST)
Date: Fri, 16 Jan 2026 10:14:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/16] MIPS: pic32: drop unused include linux/io.h
 from pic32.h
Message-ID: <aWpV26weFAGboy5Q@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-3-927d516b1ff9@redhat.com>
 <4a59d752-7aa8-4687-9618-3994efadebe2@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a59d752-7aa8-4687-9618-3994efadebe2@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 09:12:45AM +0200, claudiu beznea wrote:
> On 1/13/26 00:47, Brian Masney wrote:
> > The linux/io.h include is not used, so let's drop it from pic32.h.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > ---
> > To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: linux-mips@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   arch/mips/include/asm/mach-pic32/pic32.h | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
> > index e71c92a7bfde1342be6ea89a4bdf1389aa463b38..660fa4178b3e4e30977c8c4126df4266150062ce 100644
> > --- a/arch/mips/include/asm/mach-pic32/pic32.h
> > +++ b/arch/mips/include/asm/mach-pic32/pic32.h
> > @@ -6,7 +6,6 @@
> >   #ifndef _ASM_MACH_PIC32_H
> >   #define _ASM_MACH_PIC32_H
> > -#include <linux/io.h>
> 
> Can't this be squashed this with patch 02/16 ?

I made it a separate patch because generally if the commit message
listing all of the changes has 'and' then that's maybe a hint that
it should be split out into it's own commit.

That said, if people really want, I can push out a new series with
it squashed.

Brian


