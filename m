Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35CA515949F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 17:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgBKQPy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 11:15:54 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37850 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729925AbgBKQPy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 11:15:54 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so1438588pjb.2
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2020 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eWLMBgpnK7PE1vm+QMrBQXRtcHMP7nLx7lndIaKLkg0=;
        b=bk/+e2t3desQpp9plD5VOIdRv15kRdFIp3x+BmFNSUtaUOSdLhA+QNfwPwc7LyFg5R
         MIOUE0EE/bY1jiv8YdI/osEY6xMFegPoNiwKdx9gnONPBo/2Wf+i+tFCLR7iZDYr8xY9
         ldw6zIlM1GmF94itP9HzdGSOG0f1TutHaKePMmAz9pYGO6kaQqasYibOqVrFyIF28vT2
         xcz2NAxX8iTnrUfAaOeyIR360tobvsOCN0TzppR93Nyw3+TlGkATdruw1fpIxhpIlmNw
         ff5xf368eE6WZ+Yg4wl4k8vMUpV6mrq18mIqIdmwVs5WiSYIINySIgZOwaqCdZgytHX6
         w/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eWLMBgpnK7PE1vm+QMrBQXRtcHMP7nLx7lndIaKLkg0=;
        b=pAIXANApGkzdT2LEWKg5/cc0zj2qgn00JKRIb+xYXb8HQalbWkq4NKPnJUqy6I8ysy
         Li1zuA8/mIw38y0nrIJZ3nVQeNXX9qjuUvet6slQ9uYCeNsyewk6kQo314fO3uBL2Ius
         EGkFcsGxwiXnC8Kl6d9EdozpBqXrVnf3Jm5meDAgylbGI6QFqazjY65cXKubkYhKwm/w
         3rtMRhVY4G8F8+wHxkkUcMVXwuo1YdscrddzzwaEckNS1iSgtgGPdC767V2LkEsL84+c
         S+4/gVYTjj25tnxktywE3Tw1C6Xmy2B+F10jsyEC5C5aW8DZmETl88VnkytHSkiFm7Ij
         9KbQ==
X-Gm-Message-State: APjAAAV8FycH3zwZwSnn/qbT4hEXSLqdOPgYFBpjT7IZlTldC/D7J2ov
        JYpnJ6BfbJVjiK+1rdvyPENYCtcA
X-Google-Smtp-Source: APXvYqzhFYN7c8m33rsVnKjqNZSNrYIZp7HArCSIjlnEJ3wOvA8aZ5+epfAixtQYAt12VkX/vWyoVg==
X-Received: by 2002:a17:902:d885:: with SMTP id b5mr4011461plz.215.1581437753303;
        Tue, 11 Feb 2020 08:15:53 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
        by smtp.gmail.com with ESMTPSA id f43sm3905424pje.23.2020.02.11.08.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 08:15:52 -0800 (PST)
Subject: Re: Enabling MMC on MT7628 SoC
To:     Mauro Condarelli <mc5686@mclink.it>,
        linux-mediatek@lists.infradead.org,
        John Crispin <john@phrozen.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
References: <e6c30f55-5f65-b165-4c5d-1d25a425e744@mclink.it>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ae707c5d-3c3c-724d-1eba-adcb1db52eb9@gmail.com>
Date:   Tue, 11 Feb 2020 17:15:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e6c30f55-5f65-b165-4c5d-1d25a425e744@mclink.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[Adding MIPS people to the loop]

On 01/02/2020 17:06, Mauro Condarelli wrote:
> Hi,
> I'm trying to enable MMC/SD access on a VoCore2 SOM (based on MT7628)
> using mtk_sd driver.
> 
> Just enabling mtk_sd will bomb wit undefined function `clk_get_parent`;
> this can be trivially cured with:
> 
> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> index 2f9d5acb38ea..930c2776f6fd 100644
> --- a/arch/mips/ralink/clk.c
> +++ b/arch/mips/ralink/clk.c
> @@ -85,3 +85,9 @@ void __init plat_time_init(void)
>         clk_put(clk);
>         timer_probe();
>  }
> +
> +struct clk *clk_get_parent(struct clk *clk)
> +{
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(clk_get_parent);
> 
> 
> Naive implementation fails runtime with ENOENT in
> devm_clk_get("10130000.mmc", "source") in spite of clock definition in .dts.
> 
> I traced the problem to CONFIG_COMMON_CLK not being defined for RALINK.
> It cannot be enabled because it will lead to multiple definition of
> several clock-related functions (e.g.: `clk_get_rate`).
> I found completely disabling clock handling in mtk_sd.c leads to a (for
> me) fully working SD card.

That's probably because the boot FW already enables the clocks as needed...

> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 7726dcf48f2c..464f64bea7c6 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -730,18 +730,22 @@ static void msdc_set_timeout(struct msdc_host
> *host, u32 ns, u32 clks)
>  
>  static void msdc_gate_clock(struct msdc_host *host)
>  {
> +#ifdef CONFIG_COMMON_CLK
>      clk_disable_unprepare(host->src_clk_cg);
>      clk_disable_unprepare(host->src_clk);
>      clk_disable_unprepare(host->bus_clk);
>      clk_disable_unprepare(host->h_clk);
> +#endif
>  }
>  
>  static void msdc_ungate_clock(struct msdc_host *host)
>  {
> +#ifdef CONFIG_COMMON_CLK
>      clk_prepare_enable(host->h_clk);
>      clk_prepare_enable(host->bus_clk);
>      clk_prepare_enable(host->src_clk);
>      clk_prepare_enable(host->src_clk_cg);
> +#endif
>      while (!(readl(host->base + MSDC_CFG) & MSDC_CFG_CKSTB))
>          cpu_relax();
>  }
> @@ -2211,6 +2215,7 @@ static int msdc_drv_probe(struct platform_device
> *pdev)
>      if (ret)
>          goto host_free;
>  
> +#ifdef CONFIG_COMMON_CLK
>      host->src_clk = devm_clk_get(&pdev->dev, "source");
>      if (IS_ERR(host->src_clk)) {
>          ret = PTR_ERR(host->src_clk);
> @@ -2230,6 +2235,12 @@ static int msdc_drv_probe(struct platform_device
> *pdev)
>      host->src_clk_cg = devm_clk_get(&pdev->dev, "source_cg");
>      if (IS_ERR(host->src_clk_cg))
>          host->src_clk_cg = NULL;
> +#else
> +    host->src_clk = NULL;
> +    host->h_clk = NULL;
> +    host->bus_clk = NULL;
> +    host->src_clk_cg = NULL;
> +#endif
>  
>      host->irq = platform_get_irq(pdev, 0);
>      if (host->irq < 0) {
> 
> 
> ... but I'm unsure this hack-and-slash approach is the Right Thing to do ;)
> 

I think the correct approach would be to write a clock driver which supports the
common clock framework.

The arch/mips/ralink/clk.c basically overwrites any calls to this so that things
somehow work.

Regards,
Matthias

> As said: this works for me, but I would like to fix it properly and have
> the fix sent upstream together with my SoM defconfig.
> 
> Any hint welcome
> Regards
> Mauro Condarelli
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
