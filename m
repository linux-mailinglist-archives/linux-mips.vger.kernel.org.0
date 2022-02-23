Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306B44C1787
	for <lists+linux-mips@lfdr.de>; Wed, 23 Feb 2022 16:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238717AbiBWPpo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Feb 2022 10:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233481AbiBWPpo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Feb 2022 10:45:44 -0500
Received: from 189.cn (ptr.189.cn [183.61.185.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A35FC086D;
        Wed, 23 Feb 2022 07:45:15 -0800 (PST)
HMM_SOURCE_IP: 10.64.8.41:39052.248346700
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 6343D1001E9;
        Wed, 23 Feb 2022 23:45:09 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id 78e25a8ea10b40aeaab670c3aa257de1 for maxime@cerno.tech;
        Wed, 23 Feb 2022 23:45:13 CST
X-Transaction-ID: 78e25a8ea10b40aeaab670c3aa257de1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <dfdea1f8-635f-3abc-e051-5131ce1f705d@189.cn>
Date:   Wed, 23 Feb 2022 23:45:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
 <20220222082747.66otrkc4zwvhem7w@houat>
 <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
 <20220223143912.m727fie3vtdkvklo@houat>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220223143912.m727fie3vtdkvklo@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2022/2/23 22:39, Maxime Ripard wrote:
> On Tue, Feb 22, 2022 at 10:46:35PM +0800, Sui Jingfeng wrote:
>> On 2022/2/22 16:27, Maxime Ripard wrote:
>>>> +	if (!of_device_is_available(output)) {
>>>> +		of_node_put(output);
>>>> +		drm_info(ddev, "connector%d is not available\n", index);
>>>> +		return NULL;
>>>> +	}
>>>> +
>>>> +	disp_tims_np = of_get_child_by_name(output, "display-timings");
>>>> +	if (disp_tims_np) {
>>>> +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
>>>> +		lconn->has_disp_tim = true;
>>>> +		of_node_put(disp_tims_np);
>>>> +		drm_info(ddev, "Found display timings provided by connector%d\n", index);
>>>> +	}
>>>> +
>>>> +	connector_type = lsdc_get_connector_type(ddev, output, index);
>>>> +
>>>> +	if (output) {
>>>> +		of_node_put(output);
>>>> +		output = NULL;
>>>> +	}
>>>> +
>>>> +DT_SKIPED:
>>>> +
>>>> +	/* Only create the i2c channel if display timing is not provided */
>>>> +	if (!lconn->has_disp_tim) {
>>>> +		const struct lsdc_chip_desc * const desc = ldev->desc;
>>>> +
>>>> +		if (desc->have_builtin_i2c)
>>>> +			lconn->ddc = lsdc_create_i2c_chan(ddev, index);
>>>> +		else
>>>> +			lconn->ddc = lsdc_get_i2c_adapter(ddev, index);
>>> This looks weird: the connector bindings have a property to store the
>>> i2c controller connected to the DDC lines, so you should use that
>>> instead.
>>>
>> This is not  weird,  ast, mgag200, hibmc do the same thing.
> And none of them have DT support.
>
> Maxime
Ok, I have already correct this issue. see it at the next version.
