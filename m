Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D78E73450A
	for <lists+linux-mips@lfdr.de>; Sun, 18 Jun 2023 08:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjFRGWr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Jun 2023 02:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFRGWq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Jun 2023 02:22:46 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0446910F0;
        Sat, 17 Jun 2023 23:22:42 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8DxCeqvoo5k73cGAA--.13478S3;
        Sun, 18 Jun 2023 14:22:39 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxduStoo5kp8YeAA--.20943S3;
        Sun, 18 Jun 2023 14:22:37 +0800 (CST)
Message-ID: <a5abbedd-0b68-f64c-d6d4-2e71e3fb13c4@loongson.cn>
Date:   Sun, 18 Jun 2023 14:22:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
To:     Paul Cercueil <paul@crapouillou.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230607110650.569522-1-suijingfeng@loongson.cn>
 <c70cb3cb326439a5868beb54d720538923f653d1.camel@crapouillou.net>
 <20230617194843.GA1854380@ravnborg.org>
 <696b2c4144e454aa194e4487b41706075a70ae95.camel@crapouillou.net>
Content-Language: en-US
From:   Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <696b2c4144e454aa194e4487b41706075a70ae95.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxduStoo5kp8YeAA--.20943S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF48GrW3Kry3Ww4UWF47KFX_yoW8GFW3p3
        yDJas0vFs7ur95CwsFkr17tFy5tw1fXa1SqF1qyryqyr98tr1ftrW3ZF98WF9rJryfG3y7
        Zr93GF9rJFn7uFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
        Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
        kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
        twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
        k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
        AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
        cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
        8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
        6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2023/6/18 04:41, Paul Cercueil wrote:
> Hi,
>
> Le samedi 17 juin 2023 à 21:48 +0200, Sam Ravnborg a écrit :
>> Hi Paul,
>> On Sat, Jun 17, 2023 at 09:13:37PM +0200, Paul Cercueil wrote:
>>> Hi,
>>>
>>> Le mercredi 07 juin 2023 à 19:06 +0800, Sui Jingfeng a écrit :
>>>> Otherwise its failed to pass basic compile test on platform
>>>> without
>>>> REGMAP_MMIO selected by defconfig
>>>>
>>>> make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64-
>>>>
>>>>    SYNC    include/config/auto.conf.cmd
>>>>    Checking missing-syscalls for N32
>>>>    CALL    scripts/checksyscalls.sh
>>>>    Checking missing-syscalls for O32
>>>>    CALL    scripts/checksyscalls.sh
>>>>    CALL    scripts/checksyscalls.sh
>>>>    MODPOST Module.symvers
>>>> ERROR: modpost: "__devm_regmap_init_mmio_clk"
>>>> [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
>>>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error
>>>> 1
>>>> make: *** [Makefile:1978: modpost] Error 2
>>>>
>>>> V2: Order alphabetically
>>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> The patch looks good to me. But I need an ACK from someone else to
>>> apply to drm-misc-next.
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Thanks Sam!
Sam and Paul, thanks a lot, :-)
> Applied to drm-misc-next.
>
> Cheers,
> -Paul

-- 
Jingfeng

