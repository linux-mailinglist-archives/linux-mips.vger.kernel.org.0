Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7184310C3E4
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 07:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1GaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 01:30:04 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25801 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfK1GaE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 01:30:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574922582; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=HHhh0B7e9XWMMkwY3vm1vjuKjEqX/1lFwWNOPLDSaDXaXB4j0txh7HDijXJgHBvwoNF5tAbPQGwB/F+/JTHNE14/X0giVS/v12WQ3ALQPcUyIZNHF8ZSKCtLuzcu8L03R8yVKMxvcA71qgP0gF4KS2Zm9Kea4Wcg/cms+wQzjkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574922582; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=LZ1fwYSthwwXBIubSeQ4jYvibE6vhIL9pimY/9c6mzk=; 
        b=hXNTPW/oGM4HIAUwyfV+NrurBhh4MK688FNbXP7UNGOH4XjEPVdG4kprebE8nujEVElOobclJSI/pwcgDheGum8Si/H8mH5atOgPpnCs3xmBNx8v6NwE07HFvWHMsdg9r/p/hnDOso4YJryvetE/HBtrOAxRub5LkRMX/Nw7ChI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=HCJj/OJmbMtb/eyCTs7UlCAJHBGN7lFbKu1qMbohy5UmvYuKwvGZFg9eb3vRLW2s6ZMJFd+zfHv/
    6KkgYBHKaoRlDKRK6ymahqFNEZGiGwiitODQaPBWskTScoQbzGYr  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574922582;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=LZ1fwYSthwwXBIubSeQ4jYvibE6vhIL9pimY/9c6mzk=;
        b=q2hur5Z9qDWAE0KA6XcJtj1lgzy/gPSdoLpsssmmpDewzAl4RPUzh2I+//Cb+chI
        g4GvIk0zKP/Lhb9i8BwD3ZSiKjX5oKzQb7P73oOMjkQfIEMnPrwX7HlYPsKdpDZR63z
        Vg+/EofN/86tZ9Wbwgy7UDhTNKHESnEeqI7KndkA=
Received: from [192.168.88.130] (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1574922580821765.3860581633037; Wed, 27 Nov 2019 22:29:40 -0800 (PST)
Subject: Re: [PATCH 1/5] clk: Ingenic: Adjust code to make it compatible with
 X1830.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
 <1574825576-91028-2-git-send-email-zhouyanjie@zoho.com>
 <1574876253.3.4@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, sernia.zhou@foxmail.com, zhenwenjin@gmail.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDF694B.1000902@zoho.com>
Date:   Thu, 28 Nov 2019 14:29:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574876253.3.4@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 01:37, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer., nov. 27, 2019 at 11:32, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> 1.Adjust the PLL related code in "cgu.c" and "cgu.h" to make it
>>   compatible with the X1830 Soc from Ingenic.
>> 2.Adjust the code in "jz4740-cgu.c" to be compatible with the
>>   new cgu code.
>> 3.Adjust the code in "jz4725b-cgu.c" to be compatible with the
>>   new cgu code.
>> 4.Adjust the code in "jz4770-cgu.c" to be compatible with the
>>   new cgu code.
>> 5.Adjust the code in "jz4780-cgu.c" to be compatible with the
>>   new cgu code.
>> 6.Adjust the code in "x1000-cgu.c" to be compatible with the
>>   new cgu code.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  drivers/clk/ingenic/cgu.c         | 55=20
>> +++++++++++++++++++++++++++++----------
>>  drivers/clk/ingenic/cgu.h         | 12 ++++++++-
>>  drivers/clk/ingenic/jz4725b-cgu.c |  3 ++-
>>  drivers/clk/ingenic/jz4740-cgu.c  |  3 ++-
>>  drivers/clk/ingenic/jz4770-cgu.c  |  6 +++--
>>  drivers/clk/ingenic/jz4780-cgu.c  |  3 ++-
>>  drivers/clk/ingenic/x1000-cgu.c   |  6 +++--
>>  7 files changed, 66 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> index 6e96303..c3c69a8 100644
>> --- a/drivers/clk/ingenic/cgu.c
>> +++ b/drivers/clk/ingenic/cgu.c
>> @@ -84,7 +84,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned=20
>> long parent_rate)
>>      pll_info =3D &clk_info->pll;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl =3D readl(cgu->base + pll_info->reg);
>> +    ctl =3D readl(cgu->base + pll_info->reg[1]);
>
> I really don't like this patch. There is no info on what reg[1] and=20
> reg[0] are. First, don't use hardcoded numbers, use macros with=20
> meaningful names. Second, why not just have two fields instead of one=20
> 2-values array? That would remove a lot of the noise.
>

Because the X1830's PLL has been greatly changed, the bypass control is
placed in another register, so now two registers may needed to control the
PLL. If two fields are used, all the PLL related code of jz47xx-cgu.c /=20
x1000-cgu.c
will be more verbose. Using array methods such as:
.reg =3D { -1, CGU_REG_CPPCR0 },
in jz4770-cgu.c,

or :
.reg =3D { CGU_REG_CPPCR, CGU_REG_APLL },
in x1830-cgu.c,

can let us intuitively see that how many control registers the PLL has.
Maybe adding a corresponding comment to reg[0] and reg[1] is a better way?

>
>> spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      m =3D (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0)=
;
>> @@ -93,8 +93,17 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
>> unsigned long parent_rate)
>>      n +=3D pll_info->n_offset;
>>      od_enc =3D ctl >> pll_info->od_shift;
>>      od_enc &=3D GENMASK(pll_info->od_bits - 1, 0);
>> -    bypass =3D !pll_info->no_bypass_bit &&
>> -         !!(ctl & BIT(pll_info->bypass_bit));
>> +
>> +    if (pll_info->version >=3D CGU_X1830) {
>> +        spin_lock_irqsave(&cgu->lock, flags);
>> +        ctl =3D readl(cgu->base + pll_info->reg[0]);
>> +        spin_unlock_irqrestore(&cgu->lock, flags);
>
> Why the spinlock?
>

The original code used spinlock when reading the control register,
so when reading this new control register, I think it should also
be added with spinlock.

>
>> +
>> +        bypass =3D !pll_info->no_bypass_bit &&
>> +             !!(ctl & BIT(pll_info->bypass_bit));
>> +    } else
>
> Please comply to the kernel coding style - use brackets after the else.
>

My fault, I will fix this in v2.

>> +        bypass =3D !pll_info->no_bypass_bit &&
>> +             !!(ctl & BIT(pll_info->bypass_bit));
>>
>>      if (bypass)
>>          return parent_rate;
>> @@ -106,7 +115,10 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
>> unsigned long parent_rate)
>>      BUG_ON(od =3D=3D pll_info->od_max);
>>      od++;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    if (pll_info->version >=3D CGU_X1830)
>> +        return div_u64((u64)parent_rate * m * 2, n * od);
>
> Where does that *2 come from?

This is because the calculation method of the PLL frequency multiplication
of X1830 has changed, and a factor of 2 is added compared to the original
method (on page 381 of the X1830's PM manual).

Thanks and best regards!

>
>> +    else
>> +        return div_u64((u64)parent_rate * m, n * od);
>>  }
>>
>>  static unsigned long
>> @@ -139,7 +151,10 @@ ingenic_pll_calc(const struct=20
>> ingenic_cgu_clk_info *clk_info,
>>      if (pod)
>>          *pod =3D od;
>>
>> -    return div_u64((u64)parent_rate * m, n * od);
>> +    if (pll_info->version >=3D CGU_X1830)
>> +        return div_u64((u64)parent_rate * m * 2, n * od);
>> +    else
>> +        return div_u64((u64)parent_rate * m, n * od);
>>  }
>>
>>  static inline const struct ingenic_cgu_clk_info *to_clk_info(
>> @@ -183,7 +198,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
>> long req_rate,
>>              clk_info->name, req_rate, rate);
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl =3D readl(cgu->base + pll_info->reg);
>> +    ctl =3D readl(cgu->base + pll_info->reg[1]);
>>
>>      ctl &=3D ~(GENMASK(pll_info->m_bits - 1, 0) << pll_info->m_shift);
>>      ctl |=3D (m - pll_info->m_offset) << pll_info->m_shift;
>> @@ -194,7 +209,7 @@ ingenic_pll_set_rate(struct clk_hw *hw, unsigned=20
>> long req_rate,
>>      ctl &=3D ~(GENMASK(pll_info->od_bits - 1, 0) << pll_info->od_shift)=
;
>>      ctl |=3D pll_info->od_encoding[od - 1] << pll_info->od_shift;
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->reg[1]);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return 0;
>> @@ -212,16 +227,28 @@ static int ingenic_pll_enable(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl =3D readl(cgu->base + pll_info->reg);
>>
>> -    ctl &=3D ~BIT(pll_info->bypass_bit);
>> +    if (pll_info->version >=3D CGU_X1830) {
>> +        ctl =3D readl(cgu->base + pll_info->reg[0]);
>> +
>> +        ctl &=3D ~BIT(pll_info->bypass_bit);
>> +
>> +        writel(ctl, cgu->base + pll_info->reg[0]);
>> +
>> +        ctl =3D readl(cgu->base + pll_info->reg[1]);
>> +    } else {
>> +        ctl =3D readl(cgu->base + pll_info->reg[1]);
>> +
>> +        ctl &=3D ~BIT(pll_info->bypass_bit);
>> +    }
>> +
>>      ctl |=3D BIT(pll_info->enable_bit);
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->reg[1]);
>>
>>      /* wait for the PLL to stabilise */
>>      for (i =3D 0; i < timeout; i++) {
>> -        ctl =3D readl(cgu->base + pll_info->reg);
>> +        ctl =3D readl(cgu->base + pll_info->reg[1]);
>>          if (ctl & BIT(pll_info->stable_bit))
>>              break;
>>          mdelay(1);
>> @@ -245,11 +272,11 @@ static void ingenic_pll_disable(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl =3D readl(cgu->base + pll_info->reg);
>> +    ctl =3D readl(cgu->base + pll_info->reg[1]);
>>
>>      ctl &=3D ~BIT(pll_info->enable_bit);
>>
>> -    writel(ctl, cgu->base + pll_info->reg);
>> +    writel(ctl, cgu->base + pll_info->reg[1]);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>  }
>>
>> @@ -263,7 +290,7 @@ static int ingenic_pll_is_enabled(struct clk_hw *hw)
>>      u32 ctl;
>>
>>      spin_lock_irqsave(&cgu->lock, flags);
>> -    ctl =3D readl(cgu->base + pll_info->reg);
>> +    ctl =3D readl(cgu->base + pll_info->reg[1]);
>>      spin_unlock_irqrestore(&cgu->lock, flags);
>>
>>      return !!(ctl & BIT(pll_info->enable_bit));
>> diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
>> index 0dc8004..5f87be4 100644
>> --- a/drivers/clk/ingenic/cgu.h
>> +++ b/drivers/clk/ingenic/cgu.h
>> @@ -42,8 +42,18 @@
>>   * @stable_bit: the index of the stable bit in the PLL control register
>>   * @no_bypass_bit: if set, the PLL has no bypass functionality
>>   */
>> +enum ingenic_cgu_version {
>> +    CGU_JZ4740,
>> +    CGU_JZ4725B,
>> +    CGU_JZ4770,
>> +    CGU_JZ4780,
>> +    CGU_X1000,
>> +    CGU_X1830,
>> +};
>> +
>>  struct ingenic_cgu_pll_info {
>> -    unsigned reg;
>> +    enum ingenic_cgu_version version;
>> +    unsigned reg[2];
>>      const s8 *od_encoding;
>>      u8 m_shift, m_bits, m_offset;
>>      u8 n_shift, n_bits, n_offset;
>> diff --git a/drivers/clk/ingenic/jz4725b-cgu.c=20
>> b/drivers/clk/ingenic/jz4725b-cgu.c
>> index a3b4635..6da7b41 100644
>> --- a/drivers/clk/ingenic/jz4725b-cgu.c
>> +++ b/drivers/clk/ingenic/jz4725b-cgu.c
>> @@ -53,7 +53,8 @@ static const struct ingenic_cgu_clk_info=20
>> jz4725b_cgu_clocks[] =3D {
>>          "pll", CGU_CLK_PLL,
>>          .parents =3D { JZ4725B_CLK_EXT, -1, -1, -1 },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_CPPCR,
>> +            .version =3D CGU_JZ4725B,
>> +            .reg =3D { -1, CGU_REG_CPPCR },
>>              .m_shift =3D 23,
>>              .m_bits =3D 9,
>>              .m_offset =3D 2,
>> diff --git a/drivers/clk/ingenic/jz4740-cgu.c=20
>> b/drivers/clk/ingenic/jz4740-cgu.c
>> index 4f0e92c..3cf800d 100644
>> --- a/drivers/clk/ingenic/jz4740-cgu.c
>> +++ b/drivers/clk/ingenic/jz4740-cgu.c
>> @@ -68,7 +68,8 @@ static const struct ingenic_cgu_clk_info=20
>> jz4740_cgu_clocks[] =3D {
>>          "pll", CGU_CLK_PLL,
>>          .parents =3D { JZ4740_CLK_EXT, -1, -1, -1 },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_CPPCR,
>> +            .version =3D CGU_JZ4740,
>> +            .reg =3D { -1, CGU_REG_CPPCR },
>>              .m_shift =3D 23,
>>              .m_bits =3D 9,
>>              .m_offset =3D 2,
>> diff --git a/drivers/clk/ingenic/jz4770-cgu.c=20
>> b/drivers/clk/ingenic/jz4770-cgu.c
>> index 956dd65..a62dfb1 100644
>> --- a/drivers/clk/ingenic/jz4770-cgu.c
>> +++ b/drivers/clk/ingenic/jz4770-cgu.c
>> @@ -101,7 +101,8 @@ static const struct ingenic_cgu_clk_info=20
>> jz4770_cgu_clocks[] =3D {
>>          "pll0", CGU_CLK_PLL,
>>          .parents =3D { JZ4770_CLK_EXT },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_CPPCR0,
>> +            .version =3D CGU_JZ4770,
>> +            .reg =3D { -1, CGU_REG_CPPCR0 },
>>              .m_shift =3D 24,
>>              .m_bits =3D 7,
>>              .m_offset =3D 1,
>> @@ -123,7 +124,8 @@ static const struct ingenic_cgu_clk_info=20
>> jz4770_cgu_clocks[] =3D {
>>          "pll1", CGU_CLK_PLL,
>>          .parents =3D { JZ4770_CLK_EXT },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_CPPCR1,
>> +            .version =3D CGU_JZ4770,
>> +            .reg =3D { -1, CGU_REG_CPPCR1 },
>>              .m_shift =3D 24,
>>              .m_bits =3D 7,
>>              .m_offset =3D 1,
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c=20
>> b/drivers/clk/ingenic/jz4780-cgu.c
>> index ea905ff..59356d1b 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -220,7 +220,8 @@ static const struct ingenic_cgu_clk_info=20
>> jz4780_cgu_clocks[] =3D {
>>      /* PLLs */
>>
>>  #define DEF_PLL(name) { \
>> -    .reg =3D CGU_REG_ ## name, \
>> +    .version =3D CGU_JZ4780, \
>> +    .reg =3D { -1, CGU_REG_ ## name }, \
>>      .m_shift =3D 19, \
>>      .m_bits =3D 13, \
>>      .m_offset =3D 1, \
>> diff --git a/drivers/clk/ingenic/x1000-cgu.c=20
>> b/drivers/clk/ingenic/x1000-cgu.c
>> index b22d87b..7179b9f 100644
>> --- a/drivers/clk/ingenic/x1000-cgu.c
>> +++ b/drivers/clk/ingenic/x1000-cgu.c
>> @@ -57,7 +57,8 @@ static const struct ingenic_cgu_clk_info=20
>> x1000_cgu_clocks[] =3D {
>>          "apll", CGU_CLK_PLL,
>>          .parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_APLL,
>> +            .version =3D CGU_X1000,
>> +            .reg =3D { -1, CGU_REG_APLL },
>>              .m_shift =3D 24,
>>              .m_bits =3D 7,
>>              .m_offset =3D 1,
>> @@ -78,7 +79,8 @@ static const struct ingenic_cgu_clk_info=20
>> x1000_cgu_clocks[] =3D {
>>          "mpll", CGU_CLK_PLL,
>>          .parents =3D { X1000_CLK_EXCLK, -1, -1, -1 },
>>          .pll =3D {
>> -            .reg =3D CGU_REG_MPLL,
>> +            .version =3D CGU_X1000,
>> +            .reg =3D { -1, CGU_REG_MPLL },
>>              .m_shift =3D 24,
>>              .m_bits =3D 7,
>>              .m_offset =3D 1,
>> --=20
>> 2.7.4
>>
>>
>
>



