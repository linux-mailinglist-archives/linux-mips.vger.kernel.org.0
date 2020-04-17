Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4B61AD8E1
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 10:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbgDQIqT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 04:46:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55436 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729886AbgDQIqS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 04:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587113176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wE/WARZLg+d1WCxCwrHkOlSrWaAPnJuSBoxihd1UamI=;
        b=OBjTYKGSJAINHUfpR4calOLk+SvqbiTWr+tY+zs3pzY5Flwpjk4cqBuG2x3aiRD4IVNhzg
        dgqkfbn78l8hQEDDtCqLGyUN8+JPgq40klBBZ+xA0bHUJ1Ay+H7bhk+j1ZQtjvwM5naDj/
        2Ids74giy7NIe+3J7I39Cr7UrcIDp5I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-l4wp5We-OEy4lcIRW0d11Q-1; Fri, 17 Apr 2020 04:46:14 -0400
X-MC-Unique: l4wp5We-OEy4lcIRW0d11Q-1
Received: by mail-wr1-f70.google.com with SMTP id f2so654397wrm.9
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 01:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wE/WARZLg+d1WCxCwrHkOlSrWaAPnJuSBoxihd1UamI=;
        b=e8r1lMiEuIAQZD1066Oprk0PkEZzMy13C9quL0C8q1tXWs4edW1bLYnKEmIACqwBeV
         Pef7L6uEaXsIRqpgoQhH7yyjHQZf2YH7teeBjXi85BgW4ipH1Ow8ohdbIBACp0fqVvKY
         PN6Jcj9k4/fXeFi2h78A+pMW+L3Vg2RKlflTQK0wtrKwcC7T0+M/ZQ58LGyXu7VfQVv3
         YWYDHGqH1PLP31vV4mldm3+JT+A+1nw9ymb+LG7ttRevLwsZ8+9iFzUE8HWQURW5nzI2
         I1QA9wNAu9xtjAF9/wvZ6KiPgy5lZ5L3SVgnL8MmN50lQzCZ1TeA3cRNz0PK/dbBh18N
         OFoQ==
X-Gm-Message-State: AGi0PubtKlVkGYEpxsEQShyRohtvzB13fXxPF27HuuAUSRCjR05PM4ol
        vfEqT7XSY97nWGmNQvc1T3ioOugOndlApboArvOrhuEUBkVx/9kH6JEeDtFqkROPeHJouNJW+Zj
        qP0D+VpYg09ec+Qb9jHQQ8g==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2207010wma.26.1587113173861;
        Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypL7wwVAY2VUk1Sf/olefVQONEzwVRmuwANF/2eIBwUJQiUqpjYTnQ3meLl2WX6+2mTArW0sHw==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2206989wma.26.1587113173640;
        Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id l5sm31065502wrm.66.2020.04.17.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 01:46:13 -0700 (PDT)
Date:   Fri, 17 Apr 2020 04:46:08 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, geert@linux-m68k.org,
        tsbogend@alpha.franken.de, benh@kernel.crashing.org,
        paulus@samba.org, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
        borntraeger@de.ibm.com, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
Message-ID: <20200417044230-mutt-send-email-mst@kernel.org>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 17, 2020 at 04:39:49PM +0800, Jason Wang wrote:
> 
> On 2020/4/17 下午4:29, Michael S. Tsirkin wrote:
> > On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
> > > On 2020/4/17 下午2:33, Michael S. Tsirkin wrote:
> > > > On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
> > > > > On 2020/4/17 上午6:55, Michael S. Tsirkin wrote:
> > > > > > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrote:
> > > > > > > We try to keep the defconfig untouched after decoupling CONFIG_VHOST
> > > > > > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > > > > > ("vhost: refine vhost and vringh kconfig") by enabling VHOST_MENU by
> > > > > > > default. Then the defconfigs can keep enabling CONFIG_VHOST_NET
> > > > > > > without the caring of CONFIG_VHOST.
> > > > > > > 
> > > > > > > But this will leave a "CONFIG_VHOST_MENU=y" in all defconfigs and even
> > > > > > > for the ones that doesn't want vhost. So it actually shifts the
> > > > > > > burdens to the maintainers of all other to add "CONFIG_VHOST_MENU is
> > > > > > > not set". So this patch tries to enable CONFIG_VHOST explicitly in
> > > > > > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHOST_VSOCK.
> > > > > > > 
> > > > > > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>  (s390)
> > > > > > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>  (powerpc)
> > > > > > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > > > > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > > > > > Cc: Paul Mackerras<paulus@samba.org>
> > > > > > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > > > > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > > > > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > > > > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > > > > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > > > > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > > > > > I rebased this on top of OABI fix since that
> > > > > > seems more orgent to fix.
> > > > > > Pushed to my vhost branch pls take a look and
> > > > > > if possible test.
> > > > > > Thanks!
> > > > > I test this patch by generating the defconfigs that wants vhost_net or
> > > > > vhost_vsock. All looks fine.
> > > > > 
> > > > > But having CONFIG_VHOST_DPN=y may end up with the similar situation that
> > > > > this patch want to address.
> > > > > Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then add another
> > > > > menuconfig for VHOST_RING and do something similar?
> > > > > 
> > > > > Thanks
> > > > Sorry I don't understand. After this patch CONFIG_VHOST_DPN is just
> > > > an internal variable for the OABI fix. I kept it separate
> > > > so it's easy to revert for 5.8. Yes we could squash it into
> > > > VHOST directly but I don't see how that changes logic at all.
> > > 
> > > Sorry for being unclear.
> > > 
> > > I meant since it was enabled by default, "CONFIG_VHOST_DPN=y" will be left
> > > in the defconfigs.
> > But who cares?
> 
> 
> FYI, please see https://www.spinics.net/lists/kvm/msg212685.html

The complaint was not about the symbol IIUC.  It was that we caused
everyone to build vhost unless they manually disabled it.

> 
> > That does not add any code, does it?
> 
> 
> It doesn't.
> 
> Thanks
> 
> 
> > 
> > > This requires the arch maintainers to add
> > > "CONFIG_VHOST_VDPN is not set". (Geert complains about this)
> > > 
> > > Thanks
> > > 
> > > 

