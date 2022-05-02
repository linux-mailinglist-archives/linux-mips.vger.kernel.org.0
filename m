Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E75751752E
	for <lists+linux-mips@lfdr.de>; Mon,  2 May 2022 18:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242965AbiEBRAj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 May 2022 13:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236543AbiEBRAi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 May 2022 13:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 51BBB312
        for <linux-mips@vger.kernel.org>; Mon,  2 May 2022 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651510628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K0Gq4g+r6nSFFN2UMiOU7agj8frQhJOC3wt5ScKN4WI=;
        b=EuaI6+8mGao7a8l+K63gjGBTuhOaz9qc/BGKNFHMEg40mW5WtgLZIF9RjoeRcIZLAO04Rc
        5ZZmOh/tLkWmcpODSmYsqbE8j4iiDhq94ej36Wb0yZoAEft7kIIF9nW+S/54yO3gxlN4Hf
        uJl/Syqb7aElGuowD8ShM8d+LnU7+rU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-CmhNm6gQPFGJVj4nblSQaw-1; Mon, 02 May 2022 12:57:07 -0400
X-MC-Unique: CmhNm6gQPFGJVj4nblSQaw-1
Received: by mail-wr1-f69.google.com with SMTP id t17-20020adfa2d1000000b0020ac519c222so5468605wra.4
        for <linux-mips@vger.kernel.org>; Mon, 02 May 2022 09:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K0Gq4g+r6nSFFN2UMiOU7agj8frQhJOC3wt5ScKN4WI=;
        b=ngTRywbNw0nZn560eqFTf7o+k3jjb7gbzlCNYNYTE8oWEp7UYQJY82BEtPNZ+fEGQP
         IUw5i5vWv7kVnTTosusBJmpf+sqqUXDNDz0w+OQhzzYp2KiJQ5gfk4q5cMz7rZn+cGxf
         IhO7zPh+53Y4BD1hm7wOcBu6XY9LSe7GysEeNqNazqMt3fcpeJtKBpSXSoedyycIbdvw
         Q3NlsdsqggyxaIUb9j+rEQPeigB2/Eh3KHj1Byd7snplVJJTXaw8EZr+oA8IgPhFyzrG
         FHBIMFVPrXf6Hj7+aULnQ8LEvjjpPpzflcURI73xK4+CLySR50g1OfBpLbURWlPyzPGt
         8LMA==
X-Gm-Message-State: AOAM531tC6vWROh1egEArbZRf/KYA9Dn0Ajr1K26nETfEKkdA0j0YE5t
        7PJbJWgKoAtEyXkFr+ppAosgCvoSiSiuuhmPGF3SJVG3grTi5oaxK8WwxlpTdJKHdf73ad4x27H
        a3Fg/caDdt3jwztc5VpEKyQ==
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id l8-20020a05600c4f0800b00391fe3c40e6mr78537wmq.34.1651510626174;
        Mon, 02 May 2022 09:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBR5y6TmCRfu+8hzM0SQTGA4cZrpN3ZhuFriWyFUH2mb/ZbNn3olE2yOJI8bAuj+96a04yXQ==
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id l8-20020a05600c4f0800b00391fe3c40e6mr78523wmq.34.1651510625948;
        Mon, 02 May 2022 09:57:05 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm7273243wrr.19.2022.05.02.09.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:57:05 -0700 (PDT)
Message-ID: <ac202e93-cde2-99fa-5aca-abdc1cf6a3bf@redhat.com>
Date:   Mon, 2 May 2022 18:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, spice-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-3-javierm@redhat.com>
 <YnABz/4haOHe66Do@pendragon.ideasonboard.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnABz/4haOHe66Do@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/2/22 18:07, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 
> On Mon, May 02, 2022 at 05:38:59PM +0200, Javier Martinez Canillas wrote:
>> By default the bits per pixel for the emulated framebuffer device is set
>> to dev->mode_config.preferred_depth, but some devices need another value.
>>
>> Since this second parameter is only used by a few drivers, and to allow
>> drivers to use it for passing other configurations when registering the
>> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
>>
>> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
>> for computing options bitfield values and getting the values respectively
>>
>> For now, only the DRM_FB_BPP option exists but other options can be added.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>
>> Changes in v2:
>> - Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the
> 
> I assume you meant DRM_FB_OPTION() here, not DRM_FB_SET().
> 
>>   kernel-doc what this macro does (Laurent Pinchart).
>>

Right, that's a typo. The patch description and content are correct though.

I'll fix the patch history log in v3.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

