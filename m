Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D066F73589C
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjFSNbc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 19 Jun 2023 09:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjFSNbR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 09:31:17 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FD5E74;
        Mon, 19 Jun 2023 06:31:07 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1a998a2e7a6so3920029fac.1;
        Mon, 19 Jun 2023 06:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687181466; x=1689773466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEGefi/onIC0eCyepJlH8hSgTT8IMaedG+S+Kvs9SIU=;
        b=MrirWT5KQiiD35uyUaRjJvPSxhXvMdQNxRFXNZa3jx/cJYoC3IPYnk8ffNxRonVXTU
         IVOtwlmMx24hYFe8WYItRXNYeEmW7wjaJdoMs2ryEQCk6JTwTHU6cx45neWScE4j7AnR
         dd12AFawH/7jw8ikd37ukqKeVI3J8T1CarMW2rUucKG379/3hQv9tfMiThhdlrqVPIJ4
         YwF32rzwFHguCgyqkLIBowr0dt9n3BMbhNbHihUFQGumNH1r5ofSzwrYf7MXGD5QQoBP
         wKETbytEHuSdZ6oJOPFGMyi55iNJErMpcCZb2kqBYXqtXeUqXcunf/hYPOHlJ0ieEyMo
         XOqg==
X-Gm-Message-State: AC+VfDxWHi2Sixgbjd8PCntninfLTcnq0tvJ4yqqcy/YxE0ypPxiCXFx
        CI2rutF2k7V3LdEYEb0Y9O94Mix39GXJ+91A
X-Google-Smtp-Source: ACHHUZ4iGZYLLr/oet0cbxbdTUnW+QZYYnBGsAWZ0C8p9qglNMmmktDPSmfi34SYRVVnBMRsUgA5cQ==
X-Received: by 2002:a05:6870:35c4:b0:18f:558a:1f35 with SMTP id c4-20020a05687035c400b0018f558a1f35mr710949oak.59.1687181465318;
        Mon, 19 Jun 2023 06:31:05 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id le13-20020a0568700c0d00b001a8f6be7debsm7086066oab.28.2023.06.19.06.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:31:05 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1a9f25f271dso2580503fac.2;
        Mon, 19 Jun 2023 06:31:04 -0700 (PDT)
X-Received: by 2002:a25:cb88:0:b0:bc6:5d71:f820 with SMTP id
 b130-20020a25cb88000000b00bc65d71f820mr932905ybg.55.1687181141903; Mon, 19
 Jun 2023 06:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de> <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de> <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de> <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de> <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
 <20230619105342.ugf5gz26gcalcsi6@pengutronix.de> <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
In-Reply-To: <a6ex232lwyovzzazfh6jfvlwszppr2624czgcc5sa4nthkgecf@asauiw3rf4vi>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Jun 2023 15:25:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
Message-ID: <CAMuHMdWERLXOa4bQvsb7=gx+Q=Hn8v=XJZxahV0j3Vw1xKUYiQ@mail.gmail.com>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
To:     Maxime Ripard <mripard@kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Raymond Tan <raymond.tan@intel.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Johan Hovold <johan+linaro@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <jstultz@google.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Liang He <windhl@126.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Steven Price <steven.price@arm.com>,
        linux-rockchip@lists.infradead.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Wang Jianzheng <wangjianzheng@vivo.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Brian Starkey <brian.starkey@arm.com>,
        Karol Herbst <kherbst@redhat.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Joel Stanley <joel@jms.id.au>, nouveau@lists.freedesktop.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alison Wang <alison.wang@nxp.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Doug Anderson <dianders@chromium.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laura Nao <laura.nao@collabora.com>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Russell King <linux@armlinux.org.uk>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Qiang Yu <yuq825@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Melissa Wen <mwen@igalia.com>,
        linux-mediatek@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Lucas Stach <l.stach@pengutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

CC sfr

On Mon, Jun 19, 2023 at 2:51 PM Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Jun 19, 2023 at 12:53:42PM +0200, Uwe Kleine-König wrote:
> > On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> > > On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-König wrote:
> > > > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-König wrote:
> > > > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > > > > On Sat, Jun 17, 2023 at 9:15 AM Uwe Kleine-König
> > > > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > > > Together with the patches that were applied later the topmost commit
> > > > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to platform remove
> > > > > > > > callback returning void"). This commit was part for the following next
> > > > > > > > tags:
> > > > > > > >
> > > > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > > > >         next-20230609
> > > > > > > >         next-20230613
> > > > > > > >         next-20230614
> > > > > > > >         next-20230615
> > > > > > > >
> > > > > > > > However in next-20230616 they are missing. In next-20230616
> > > > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a35088660.
> > > > > > > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 (that are
> > > > > > > > also not included with a different commit id). The 37 patches dropped
> > > > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > > > > > >
> > > > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290
> > > > > > > >              1  Christophe JAILLET
> > > > > > > >              2  Jessica Zhang
> > > > > > > >              5  Karol Wachowski
> > > > > > > >              1  Laura Nao
> > > > > > > >             27  Uwe Kleine-König
> > > > > > > >              1  Wang Jianzheng
> > > > > > > >
> > > > > > > >
> > > > > > > > I guess this was done by mistake because nobody told me about dropping
> > > > > > > > my/these patches? Can c2807ecb5290 please be merged into drm-misc-next
> > > > > > > > again?
> > > > > > >
> > > > > > > Actually, it was probably a mistake that these patches got merged to
> > > > > > > linuxnext during the 4 days that you noticed. However, your patches
> > > > > > > aren't dropped and are still present in drm-misc-next.
> > > > > > >
> > > > > > > drm-misc has a bit of a unique model and it's documented fairly well here:
> > > > > > >
> > > > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > > > > >
> > > > > > Is there a flaw then in this unique model (or its implementation) when
> > > > > > drm-misc/for-linux-next moves in a non-fast-forward manner? This isn't
> > > > > > expected, is it?
> > > > >
> > > > > There's no expectation afaik. Any tree merged in linux-next can be
> > > > > rebased, drop a patch, amend one, etc. without any concern.
> > > >
> > > > I agree that there are no rules broken for a tree that is included in
> > > > next and a maintainer is free to rewrite their tree independant of the
> > > > tree being included in next.
> > > >
> > > > Still I think that shouldn't be used as an excuse.
> > >
> > > As an excuse for what?
> >
> > Just because the rules for trees in next allow the merged branch to be
> > rewritten, shouldn't be used to justify rewriting the branch.
> >
> > IMHO you still should ensure that only commits make it into any next
> > snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
> > intend to be included in X-rc1.
>
> That's never been a next rule either. Rust support has been in next for
> almost a year without being sent as a PR for example.

https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.Process.rst#L297

   "The linux-next tree is, by design, a snapshot of what the mainline
    is expected to look like after the next merge window closes."

The general rule for linux-next is that its contents are intended to end
up in the next kernel release, and that it should not contain commits
that are intended for the next-next release, cfr. what Stephen sends
out to new trees:

   "You will need to ensure that the patches/commits in your tree/series have
    been:
            [...]
         * destined for the current or next Linux merge window."

and what he requests regularly in his announces, e.g.:

   "Please do not add any v6.4 related commits to your linux-next included
    branches until after v6.3-rc1 has been released."

AFAIU, the exception to the rule is new, self-contained, and sometimes
controversial development, which may have to cook for a few more cycles,
if it ends up in a PR at all.

> > > > For me, if a maintainer puts some patch into next that's a statement
> > > > saying (approximately) "I think this patch is fine and I intend to
> > > > send it to Linus during the next merge window.".
> > >
> > > I mean, that's what we're saying and doing?
> >
> > No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as it
> > was part of next-20230609). A few days later however the patches were
> > dropped.
> >
> > The two options that would have made the experience smoother for me are:
> >
> >  a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
>
> That's not an option. You were simply too late for v6.5-rc1, unless you
> expect us to get rid of timezones and work on week-ends. But surely you
> don't.

I don't think anyone expects you to do that...

> >  b) keep c2807ecb5290 in a branch that doesn't result it entering next
> >     before v6.5-rc1.
>
> All the drm-misc committers use dim. If that's a concern for you, feel
> free to send a patch addressing this to dim.

So you say this is an issue with the tooling? ;-)
If the tooling breaks the rules, perhaps the tooling should be fixed?

> > > > So my expectation is that if a patch is dropped again from next, there
> > > > was a problem and it would be fair if the maintainer tells the
> > > > author/submitter about this problem and that the patch was dropped.
> > >
> > > But it wasn't dropped,
> >
> > From my POV it was dropped from next as it was part of next between
> > next-20230609 and next-20230615 but not any more since next-20230616.
> > You talk about (not) being dropped from some branch in drm-misc, that's
> > irrelevant for the thing I'm complaining about.
>
> You were never told that they were merged in linux-next, but in
> drm-misc-next. If they did, it's mostly an unfortunate artifact.
>
> We have a documentation that explains the process and how drm-misc-next
> works. If that's still confusing somehow, feel free to amend it to make
> it clearer.

Why that document may apply to drm-misc-next, everything that appears
in linux-next should follow the linux-next process
https://elixir.bootlin.com/linux/latest/source/Documentation/process/2.Process.rst#L256

> > > it's still very much to be sent to Linus during the next merge window.
> >
> > "next merge window" as in the one leading to 6.5-rc1? Either we mean
> > different things when we say "next merge window", or there is a
> > misunderstanding I don't see yet.
>
> Linus doesn't want to receive in a PR patches that haven't been in
> linux-next for at least two weeks. In most cases that's rc6, which means
> that by the time we send our last PR before rc6, the
> next-merge-window-while-still-meeting-Linus-requirements is 6.6.
>
> The rule applies to all trees, and it's why the soc tree also requires
> its submaintainers to submit their PR before -rc6.

Unless there's a very good reason to deviate from that (e.g. a bug fix).

> So yeah, sorry if it was confusing. At the end of the day, it's a
> compromise, and I can't find a better one for everyone involved
> (maintainers, contributors and committers alike) off the top of my head.

As I understand, the main issue Uwe is objecting to, is that his
patches ended up in linux-next first, only to be dropped again from
linux-next later, and that there was no communication about the
latter.

If you're not constantly working on a subsystem, it can be very hard
to keep track of the status of your own drive-by patches. When patches
get applied, appear in linux-next, and disappear from linux-next again
later, it's worse...

Thanks for your understanding!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
