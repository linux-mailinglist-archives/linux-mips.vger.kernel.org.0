Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18D974767A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jul 2023 18:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjGDQ0e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jul 2023 12:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjGDQ0c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jul 2023 12:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1D10CF
        for <linux-mips@vger.kernel.org>; Tue,  4 Jul 2023 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688487942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
        b=dtjWkysOlHq5uaRMSRftHkei1a1ILK6vtvXDwGWxj6H9UtNGfSZziG3QQXv3Pw/9mYaOT5
        BFgwdS2tZNoR+A98bGas5LWcWuye1DM2KCxquN9mBMZb8/j6FpFxHM5nnSCZGzzPFrdDPs
        9kEqHhmCTaHdL/oBciG6FhPCYaKlV+I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-_ehJcg8OMpeowVJH9H7dDg-1; Tue, 04 Jul 2023 12:25:41 -0400
X-MC-Unique: _ehJcg8OMpeowVJH9H7dDg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbab56aac7so36502715e9.1
        for <linux-mips@vger.kernel.org>; Tue, 04 Jul 2023 09:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487940; x=1691079940;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M8/mkORscNjCU/dvtXt+o+8I4w7Qa8785g4rCe6dq88=;
        b=h6MgxPfZR3iVyZhQ32YPHwMFRZQkG+sXyWQeqXz22w+qsG6ybVcdMQyjsiaC7xv66Q
         BOG4UUoUXUos+wbjEJ3hjueKQ+2TG2nAcCIMlH4b56d7zaBSjToUevp3hitzECuGuDbz
         zoSsHRp0U7arrzhxTBCTp+jiIvZlp5njaUVWfsB8EJoL+0OE/8CjVGX7M1iStirxpIWq
         Fkh2+doLEiPoh59WfP9y3eperNOlrCfy3ANR2UZo12PEBXFjNEmtvbsGxSXpiCS35feD
         6TwhjAMuaKffDh35CZTqgg44mB7Bdyn3eP4tD/eGboomVmMv4LUdmwMwo0QkNlO4TnFg
         7HOQ==
X-Gm-Message-State: AC+VfDyb1oZ8rszm+m0GvhCMI6b2BUlb30gSCIEaTiqna9oR9VF9qow5
        jEpYjybyma2Ju5yqcv6JPTW5vbLGqP5cFzO/XDUfHqYIh2C0gl25bCzdXlPVR7E4rsqobGeAIza
        cYZRPXwgbXd6KooDXrcuz6Q==
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082777wmm.19.1688487940448;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5IB6++c8U11SK9oMV+tMdqHs9QUr8ub/i7nSM7HKLee5NlCRabAo+D01Z67Wv3BYjVWg90GQ==
X-Received: by 2002:a05:600c:c1:b0:3fa:8cd8:9743 with SMTP id u1-20020a05600c00c100b003fa8cd89743mr12082767wmm.19.1688487940180;
        Tue, 04 Jul 2023 09:25:40 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b003143b032b7asm4333122wrx.116.2023.07.04.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:25:39 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
        deller@gmx.de, daniel@ffwll.ch, airlied@gmail.com
Cc:     linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        loongarch@lists.linux.dev, linux-alpha@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Teddy Wang <teddy.wang@siliconmotion.com>
Subject: Re: [PATCH 02/12] fbdev/sm712fb: Do not include <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-3-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-3-tzimmermann@suse.de>
Date:   Tue, 04 Jul 2023 18:25:39 +0200
Message-ID: <87fs63lk3g.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Sm712fb's dependency on <linux/screen_info.h> is artificial in that
> it only uses struct screen_info for its internals. Replace the use of
> struct screen_info with a custom data structure and remove the include
> of <linux/screen_info.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Helge Deller <deller@gmx.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

