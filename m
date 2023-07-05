Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67B5747E85
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jul 2023 09:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjGEHsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 03:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbjGEHsM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 03:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E3C1709
        for <linux-mips@vger.kernel.org>; Wed,  5 Jul 2023 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688543196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
        b=bvtdsMB3TTi+6muykpHIIQ0A3AvT01aPDochyxGzhVwN5XImzQvuvqiWgY30SlBNp9xbR7
        X+KIFZJfCG/FupP191BtP1KMoFSrsQZI0zvvJZuCwEve2VWRivHkRa3WedCjk6SJq62EmR
        BsMIezWaYYDX4m2P3zvIoWpVQSUA3SU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-tIBuhb6NOzakAqZBZcOTCg-1; Wed, 05 Jul 2023 03:46:35 -0400
X-MC-Unique: tIBuhb6NOzakAqZBZcOTCg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30932d15a30so4256129f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 05 Jul 2023 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543194; x=1691135194;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErZ583UAFFXXktAwUkPKfSDXi8WyYfGqw8H1xV5E3EY=;
        b=Ze4Oqdu0kvYKVVONF/VOsAwFXyqsHPsJW55GcMIBHEnwlVUx9vIb+2wvN44Xf1DqEL
         48rkmZkyLSYIX5K4fbz3RdIM/hK+p27SYVrSMP3t7+XYQ1v6j0V86owCA3rUM5fDugO7
         uymN1V3QYDujbOMNOJOY5wxseZqfgnBMN9j63SQbWL+ELdoErQ1yUfKppCoF1+kGQV6a
         1jV/lpzdNy0m0GjDlwnRELsXPJm0dcJdp4KBlTSUspNgJASHOMTeff9SpodLbPeeUqAY
         wwRVu/8Ms2VIw02FBdFnMS9ugG3Ff6DTvCs8ER2fOjbB4LPjq1UdF2z/DOGtnXlgAs7E
         aPVg==
X-Gm-Message-State: ABy/qLb47+Dtll26H9Zs/DE4coIZImEe/rRsvIMU+L2XYeJnjW/OG8g5
        bEhczmFynT644C7BL7NhtG7WBaOa8WfZfYWpHM29V6RXC2hIL3ym0XxTU0ebOyFqOecDhZTW7ms
        Igo/Ob3ku06NwTLjbiVt1RA==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085719wrm.8.1688543194261;
        Wed, 05 Jul 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFsu0NXA2DcqaEBs6I3Rg+ekfJ+Y9cFLpHbU/8XeUuuyRyAepiisRLN9BUbx4g3BoqHacYmEg==
X-Received: by 2002:adf:e44d:0:b0:314:2732:e81e with SMTP id t13-20020adfe44d000000b003142732e81emr13085694wrm.8.1688543193994;
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6e85000000b003063a92bbf5sm30496891wrz.70.2023.07.05.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 00:46:33 -0700 (PDT)
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
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/12] drivers/firmware: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-9-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-9-tzimmermann@suse.de>
Date:   Wed, 05 Jul 2023 09:46:32 +0200
Message-ID: <87bkgqssvb.fsf@minerva.mail-host-address-is-not-set>
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

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

