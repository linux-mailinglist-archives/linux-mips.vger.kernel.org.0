Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA1070EA41
	for <lists+linux-mips@lfdr.de>; Wed, 24 May 2023 02:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbjEXA3f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 20:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238596AbjEXA3d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 20:29:33 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A723819B
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 17:29:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ae64580e9fso6755ad.1
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=oCPd/VMBzehzBIwxKD0CUQlcv9XnCqSIGnZFpfNhT9159UiXp4+4s0dt1T5T+r2N8u
         ejdMVEW9GWrQK3u8D/R+OgCl4fi8an2VY0K+/eeCPWT2cGGSET/E3kHkr5iqimXeopNz
         1LhLEfNIl9101bv8HdubYyq2hpbrF89XLwyNahFvZOtnckCP7CoEZsh2L+2+OK9q9Yjc
         K9vC86dI9TWXu3/6r3ILFI/gvIY8hkiVXH1FcP052iNl13PiuUL4NAyi+n5JDzxUMMjc
         YVmWP+V4GT0WZnv89R5QJMFswFGyufptXG7L83ZUIfYIL/yWyXKcEjeZvi21gEBg088G
         o5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684888159; x=1687480159;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iGDu91GXvHaUJ4/GkDIwXiVromlKTEDnrVX/jdHHE=;
        b=C2FNLAJ09TLpPQcdQhBL5aPICn2DEK7zJbSajv3TwZlMGBL1BZAqjgYeHOeNaKF296
         T/kKcTT2VQfB7GxY5T8hJbt6LkWHfBbwbsSErfyT6hDx5S6sJvOcADwQc8mbFlE1zC4H
         NVM80xhhYJVvwFOspYSNf8E501wbK3o8Qm5fAo8XaXQp7qyp9GxUs7vLYxdkQN9d6fgb
         fiWnrfmmpPBmezUc7FCQy91v05RMjFJC64+S6KLbFStBBflDy94/bOpr9mMBi3gWl1Zm
         Gfn+i85XLnZsdCgHMeXqusyKAetqOzX8SNLj+x0DiYpn8IAdhfrmD2LzMX3sN9VtLGfK
         yhaA==
X-Gm-Message-State: AC+VfDwzZ39bQ/4ifP5LiIVp/ZWWmM0VKDbsWbbVaEU0TD0CL3s7Q9da
        y3fQWU6LQVKeVSUIn78b56pCrw==
X-Google-Smtp-Source: ACHHUZ4WC86fv/HCojVq6Z7bo1LnEN2P8Qa/JJdhSbqAvm7x1JKXoIG4BePTyVsmdwlyiuzkRQj4Vw==
X-Received: by 2002:a17:902:e847:b0:1af:90ce:5263 with SMTP id t7-20020a170902e84700b001af90ce5263mr107385plg.26.1684888158675;
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Received: from [2620:0:1008:11:c789:c1fb:6667:1766] ([2620:0:1008:11:c789:c1fb:6667:1766])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090a929400b0024de0de6ec8sm137193pjo.17.2023.05.23.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 17:29:18 -0700 (PDT)
Date:   Tue, 23 May 2023 17:29:17 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Vlastimil Babka <vbabka@suse.cz>
cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
Message-ID: <be109b49-8510-5887-72ae-738db9945619@google.com>
References: <20230523091139.21449-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 May 2023, Vlastimil Babka wrote:

> As discussed at LSF/MM [1] [2] and with no objections raised there,
> deprecate the SLAB allocator. Rename the user-visible option so that
> users with CONFIG_SLAB=y get a new prompt with explanation during make
> oldconfig, while make olddefconfig will just switch to SLUB.
> 
> In all defconfigs with CONFIG_SLAB=y remove the line so those also
> switch to SLUB. Regressions due to the switch should be reported to
> linux-mm and slab maintainers.
> 
> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
> [2] https://lwn.net/Articles/932201/
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: David Rientjes <rientjes@google.com>

The Kconfig option says that SLAB will be removed in a few cycles.  I 
think we should wait until at least the next LTS kernel is forked at the 
end of the year so that users who upgrade to only the LTS releases can be 
prompted for this change and surface any concerns.  Slab allocation is a 
critical subsystem, so I presume this is the safest and most responsible 
way to do the SLAB deprecation.  Hopefully that timeline works for 
everybody.
