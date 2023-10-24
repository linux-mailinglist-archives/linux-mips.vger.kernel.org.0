Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1810E7D4888
	for <lists+linux-mips@lfdr.de>; Tue, 24 Oct 2023 09:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjJXH3N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Oct 2023 03:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjJXH3M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Oct 2023 03:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9E410C9
        for <linux-mips@vger.kernel.org>; Tue, 24 Oct 2023 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698132500;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Xssyl2cuWO4huKRCeLzBIy8S2pbYD719FEsBYqUWtcA=;
        b=a/ZQHG9XnxhiPWndvPlBu3rtLJB7vAoIEd+zlDr4KVUXQSbmi0JZWoZjYUdwy0d5ndjcVi
        clWuzUHATWfPSsnMweHlLgDlUEIl34IBtnay2HdEJFmMVdFtnv18tzLzr6ay3650oSdsTV
        mjZDGe/awlFOsnOaUSGPEKTxqoa44iw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-H1iUpZKJPl-jgGp1-dFzJg-1; Tue, 24 Oct 2023 03:28:19 -0400
X-MC-Unique: H1iUpZKJPl-jgGp1-dFzJg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40837aa4a58so22160745e9.0
        for <linux-mips@vger.kernel.org>; Tue, 24 Oct 2023 00:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698132498; x=1698737298;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xssyl2cuWO4huKRCeLzBIy8S2pbYD719FEsBYqUWtcA=;
        b=CJmd8BTPhb4JlAwqYA0fO5Mlw7iFOxvmLRs5Rky9CyoIAuuKWSxDk5IO3ICUSTi/7N
         wLhcBbIw3wAV5QrvIqkk6ezrcuX6Oxrkvb0xryoENTCFh8VJSH1tEGsAmGSnjxlsT4GA
         xMidz8/tlYZ64y5Mo8i/yiaiHUbq3u4mJJim5JPczREBxNB2+IZuK9TrF8EpjFXAm0yk
         MssE/B4JHAn2BU4zlq4KDhqDBnWLlD/Q+hVfyPsDxuKY2euvZ8U0q1pj5XcA/P9zyRbE
         8WH/bpi6JGdhPJoua3IX1gcHTUtBhrt6Jkt+J0XKhdTAnaODM9OuYgIBcS0jcSqTpBAB
         WbQg==
X-Gm-Message-State: AOJu0YwfsmxF7589XCI4De2zLMY9oXkj20pq/RrJjvn4AGkeXYzMuNYZ
        JjoKF2U7uiZ9aRy9D+NK3J25cnV1Z1tJUzNKqVmHhhIDfi5VSLUsKbofGJRKtmNFlrhHLsm2hTS
        d6pK72mQPNFNQ2bO7PrS18w==
X-Received: by 2002:a05:600c:602a:b0:407:4126:f71c with SMTP id az42-20020a05600c602a00b004074126f71cmr14169963wmb.6.1698132498093;
        Tue, 24 Oct 2023 00:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYDvYHh+MlKZ7YVUkxps/fFostO9uWTdFJHZIFS+9S/NQGTJDnI4KulBOWTrPTjqcmhrY/9w==
X-Received: by 2002:a05:600c:602a:b0:407:4126:f71c with SMTP id az42-20020a05600c602a00b004074126f71cmr14169939wmb.6.1698132497770;
        Tue, 24 Oct 2023 00:28:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c428300b003fee8793911sm11033357wmc.44.2023.10.24.00.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 00:28:17 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        Khalid Aziz <khalid@gonehiking.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vgacon: fix mips/sibyte build regression
In-Reply-To: <20231024054412.2291220-1-arnd@kernel.org>
References: <20231024054412.2291220-1-arnd@kernel.org>
Date:   Tue, 24 Oct 2023 09:28:16 +0200
Message-ID: <877cnc1nu7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> The conversion to vgacon_register_screen() was missing an #include statement
> for the swarm board:
>
> arch/mips/sibyte/swarm/setup.c:146:9: error: implicit declaration of function 'vgacon_register_screen' [-Werror=implicit-function-declaration]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310240429.UqeQ2Cpr-lkp@intel.com/
> Fixes: 555624c0d10b vgacon: clean up global screen_info instances
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Loos good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

