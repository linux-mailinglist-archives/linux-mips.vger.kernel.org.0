Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB03474769B
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jul 2023 18:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjGDQ2G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jul 2023 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbjGDQ1x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jul 2023 12:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D56F10CF
        for <linux-mips@vger.kernel.org>; Tue,  4 Jul 2023 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688488024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
        b=IoqvCJX6lE4j+UmnwZA7z72UsV2S3zbHIP+YGKf3IZISnldZ+S+YvM/oWwWGbPjxdGwUm9
        e3gS7cE5UoYMvY5+mkvxusNW+bm6C7YoKtP5ydBHx/ylP++wrzhLliGjD+XYeQJvfQWsLB
        GLdRYMAsBRYT9d7SaAdBt8+BiAkEFcA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-09rQZoCrMeOirVo4wSb5KA-1; Tue, 04 Jul 2023 12:27:03 -0400
X-MC-Unique: 09rQZoCrMeOirVo4wSb5KA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbdd5d09b8so10945735e9.1
        for <linux-mips@vger.kernel.org>; Tue, 04 Jul 2023 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488022; x=1691080022;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
        b=Kcch+39WpB50WVr34ZigjoISm4JVqAHRBXoeYA174eWnkY14I4UBZB0IEWvVqMRfiK
         rtqfXp1yCcwtdv6AZ+HJ9S0mJxFVVNleuNAAWQl3Kz+hw4bAYYTBEoIxwU0GqpCHryIB
         vtxZIvFRZpPuA4xG4KJkYYWzaVjG17Q05Fo9KHXq3SailYSp1X9XwLgwWc+gaK3hAyH5
         IyLvYixgGKYu5m2/krOkQU/Y85MDYxP+Upn8mCkzqMN2LErEzVS8uO5Ff0iki+97xn9a
         dLmu4EJEbhx84zxNwDXDRkrn9R0u03Ore0Z59dluNSN3ZySs5IlzbscWoCBGJcAcOwmF
         mCtA==
X-Gm-Message-State: AC+VfDwdw7qajc4ukcGNflPiDd596njAy6qCA5HAg8KvSkWzNSbk2BC6
        0EzaCoDZbMS5Pt8cVSu0jnPkak3ffFGueuhUkaEII6cl5ySy3XEDn+ZRSfnGk8OjpJ64M/riIUw
        r2O+TBHw071A5DUS92YscLg==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432849wmg.22.1688488022230;
        Tue, 04 Jul 2023 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NuEVxTetvep8Gr1fgiFutV/xXoEkUhrAhQSPThqJdTuxw2Km/uBAzmwN3pOgdQUZIHRImng==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432831wmg.22.1688488021988;
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm7499354wrd.29.2023.07.04.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
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
Subject: Re: [PATCH 04/12] staging/sm750fb: Do not include
 <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-5-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-5-tzimmermann@suse.de>
Date:   Tue, 04 Jul 2023 18:27:01 +0200
Message-ID: <87a5wblk16.fsf@minerva.mail-host-address-is-not-set>
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

> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

