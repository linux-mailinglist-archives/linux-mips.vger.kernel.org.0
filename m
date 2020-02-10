Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 746A61585F0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 00:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgBJXHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Feb 2020 18:07:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46902 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbgBJXHp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Feb 2020 18:07:45 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so3414489pll.13
        for <linux-mips@vger.kernel.org>; Mon, 10 Feb 2020 15:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/3k0mO5Qptj/CKl3cE4MMn6nd/4T/1YArKd9TN4vChk=;
        b=Gm4AWKAG7rjIUAXSVD9OEfc/hTOFnYzhXgiMjP7jiRpChs2ekoG6g5Km9JRJsozJhb
         YVESRR98FiAYVV+TpowGPe+fSXmzISVjnGHAfCj78cBtqXxJYhoZ2N6xN6MiWEV96mD1
         azPVmtf39Ad7IDqpVFixr2BsvijuIOLg2jhAWFxB6JdWGh+fKV7FxPbomxbO36uktDHu
         ol9MRPMU8VeK0wmaCeEDoXqjdBpw95QYAu3IEQ6eugnVriQ06FHy2Cqa+ZRfes18I4K4
         lxtLsJLviksyW9uClCugDNPtk1oIehwLcdXQQdSxo/tM54yaiXxQuu+PlD2VQ6a6lz8d
         PUKQ==
X-Gm-Message-State: APjAAAXZqihVS8iLYi1iYb+XELbrAd/mqemlDsrFFbCPtV6SfiDGyMqv
        7aoEZBm8YvbQT911aXVXiYKe6cnhpvGaqQ==
X-Google-Smtp-Source: APXvYqxEEezIVfGFBgqHmFF6KiHDUKjJKdz8FB/E1oCYmoBSKF31mRwtdCDdMUQJBbeX+XuKcE4vOw==
X-Received: by 2002:a17:902:bc88:: with SMTP id bb8mr14346791plb.274.1581376064849;
        Mon, 10 Feb 2020 15:07:44 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id u18sm1170944pgi.44.2020.02.10.15.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 15:07:44 -0800 (PST)
Date:   Mon, 10 Feb 2020 15:11:15 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Victor Kamensky (kamensky)" <kamensky@cisco.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Message-ID: <20200210231115.raakjwtmjk5apun6@lantea.localdomain>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
 <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
 <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>
 <20200210225229.4px5rljkici4mlrj@lantea.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200210225229.4px5rljkici4mlrj@lantea.localdomain>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Victor,

On Mon, Feb 10, 2020 at 02:52:29PM -0800, Paul Burton wrote:
> It would be good to submit a v2 of this patch with the commit message
> updated to explain that some toolchains attempt to use the GOT without
> these flags being specified, and even better if you can figure out why
> that happens.

Whilst we're at it - both flags are supported by gcc 4.6 so we can drop
the use of the cc-option macro & just specify them unconditionally.

Thanks,
    Paul
