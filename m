Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA074119E96
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 23:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfLJWyH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 10 Dec 2019 17:54:07 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35845 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfLJWyH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 17:54:07 -0500
Received: by mail-pg1-f193.google.com with SMTP id k3so8978234pgc.3;
        Tue, 10 Dec 2019 14:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Uc6nUyx0tWcpYbMt8ma4oxDDyJv0615QHHpUzzEGUYg=;
        b=rxTdYtyGil11OqU8xmilGx2QIhnrRQcS1GdxFVeauU7mqgYLfkCMHh1d3sSWVL6NJl
         ivjN7IxT979Jzm1kaPgtIi+QihFy4Oqn8D8VEreDwBd4voC4cOBRJw/hfBvT/Rj1Qg5o
         DAI1vPVqmDnCXyX7pcRvgADjtky6zy/SzXGUv7SdPv7aqIJouSsxSjIXZVqOMA8hn90x
         D34Al5YdmKeXNEvRde7WF4RCvVwVWdCxmUpX7xcrumDKwgdhNVmrqpiyP81cAYmWO1Ff
         JVDBlvKxf52ZuWJoVUtTA+xr1XBh8dC1prX8OrjqzZMsyKNgnJws5sppaxegBVSsclTd
         eDTw==
X-Gm-Message-State: APjAAAUXkOvoij9bOIJndIpMr1fc5+Aw4gPwNVBnc5gKztuDC0LHY5wf
        uAfJ/uDi5ppSEFqRfpJVFcM=
X-Google-Smtp-Source: APXvYqzT4nRMuygUybmv0z7MJHp0Jn15ImWI/vUXkOVE8NMGjoWmLiq4x33grbemVSea0CIPzLKwZQ==
X-Received: by 2002:aa7:9d0d:: with SMTP id k13mr344069pfp.254.1576018446035;
        Tue, 10 Dec 2019 14:54:06 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id d4sm37554pjz.12.2019.12.10.14.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:54:05 -0800 (PST)
Date:   Tue, 10 Dec 2019 14:55:03 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, mturquette@baylibre.com,
        sboyd@kernel.org, mark.rutland@arm.com, syq@debian.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: Re: [PATCH 1/5] clk: Ingenic: Adjust code to make it compatible with
 X1830.
Message-ID: <20191210225503.nf77ksu2sznngbp2@lantea.localdomain>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
 <1574825576-91028-2-git-send-email-zhouyanjie@zoho.com>
 <1574876253.3.4@crapouillou.net>
 <5DDF694B.1000902@zoho.com>
 <1575026622.3.2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1575026622.3.2@crapouillou.net>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul, Zhou,

On Fri, Nov 29, 2019 at 12:23:42PM +0100, Paul Cercueil wrote:
> > > > @@ -93,8 +93,17 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,
> > > > unsigned long parent_rate)
> > > >      n += pll_info->n_offset;
> > > >      od_enc = ctl >> pll_info->od_shift;
> > > >      od_enc &= GENMASK(pll_info->od_bits - 1, 0);
> > > > -    bypass = !pll_info->no_bypass_bit &&
> > > > -         !!(ctl & BIT(pll_info->bypass_bit));
> > > > +
> > > > +    if (pll_info->version >= CGU_X1830) {
> > > > +        spin_lock_irqsave(&cgu->lock, flags);
> > > > +        ctl = readl(cgu->base + pll_info->reg[0]);
> > > > +        spin_unlock_irqrestore(&cgu->lock, flags);
> > > 
> > > Why the spinlock?
> > > 
> > 
> > The original code used spinlock when reading the control register,
> > so when reading this new control register, I think it should also
> > be added with spinlock.
> 
> Well, the original code looks wrong to me. There's nothing to protect here.
> 
> Maybe @Paul Burton can shed some light?

I wish I could remember, but I agree it seems pointless here. The only
way I can think it could be of any use is if writes to the CGU register
we're accessing aren't atomic (ie. if we could observe a partially
completed write), but I don't believe that's the case.

So Zhou, if you want to drop the spinlock here from your X1830 path &
ideally also add a patch to remove it in the non-X1830 path that would
be great.

Thanks,
    Paul
