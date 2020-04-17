Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E253C1ADA2A
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 11:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgDQJir (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 05:38:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44457 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730303AbgDQJiq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Apr 2020 05:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587116324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EVkbDn8gkw5+Noos0y5yOQUyWaS8jqC9S0wOjm7uqw4=;
        b=E7yXcE89s8jUeGNZATNBPoSWrofGS94YVwHEkjOM1Zbj93t+wjSsvXUp8kQp3ppEDp76GZ
        0QycDRKY8T5P+F+X3L8f+xgNB/bQIHoBt6VWMU4KuwyJGJB6ej1bcfWMNzHCENw4W8uC1d
        gPzgPXP4TwoNcOd0ZC0km/IVtsgORRs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-kuwHU1cZNwG66gVzHIu7cQ-1; Fri, 17 Apr 2020 05:38:43 -0400
X-MC-Unique: kuwHU1cZNwG66gVzHIu7cQ-1
Received: by mail-wr1-f69.google.com with SMTP id r11so699680wrx.21
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EVkbDn8gkw5+Noos0y5yOQUyWaS8jqC9S0wOjm7uqw4=;
        b=oQIAdAKEpoIHOtvllwdEOVRZMCET+trC1aCJvYRiuUO2xo8+G41aHUcqS87IhdfCf1
         qeChXoi8ps2eiAJJTQ5Ex21KTAPurIOGJgPVVH6OKC51c0OSN7dN3CG9RwtwuUUWToM7
         13+yIp1Gv+K5Uy8DeSgME0pm6LTSO3mL3AaFv/VRRXUd6V4Ze7alHiu4DHjeQfj3HQUd
         ds1VBag6LXVuCULLSF0lmP0EwIaOcSsbi5BgGsp+PPoxTnR+xIN3GSxUYxcs5426GNzJ
         rTIY8if8FR0n8iDLituppZSFo9AYSc2NqqdvnNILezeG5yTH1nUCreKaGB/VQjFc2oq4
         FuyQ==
X-Gm-Message-State: AGi0PuYDCdNc3g8e9j448VALuYr7ZifyP6l8kqLJxNxN56opT+jggaid
        S9XXTqvpvChTrJ86v5xRO6/ETSmgTpnOGHirZxPMJhNQOEI7eRq/r0jJ6N8JJ15ZODgBNARkLqs
        wbsJslRl06GdXSjo/yOFl4w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr1264155wrm.334.1587116322163;
        Fri, 17 Apr 2020 02:38:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypLI0ZplMhJRXp9IgnvDd4jNrwD2zcF2noQBvqCsovqT0NxBwm05qUG6Nsovmh0zi9ATjf9KqA==
X-Received: by 2002:adf:e711:: with SMTP id c17mr1264134wrm.334.1587116321952;
        Fri, 17 Apr 2020 02:38:41 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
        by smtp.gmail.com with ESMTPSA id a24sm6912835wmb.24.2020.04.17.02.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 02:38:41 -0700 (PDT)
Date:   Fri, 17 Apr 2020 05:38:38 -0400
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
Message-ID: <20200417053803-mutt-send-email-mst@kernel.org>
References: <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417050029-mutt-send-email-mst@kernel.org>
 <ce8a18e5-3c74-73cc-57c5-10c40af838a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce8a18e5-3c74-73cc-57c5-10c40af838a3@redhat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 17, 2020 at 05:33:56PM +0800, Jason Wang wrote:
> 
> On 2020/4/17 下午5:01, Michael S. Tsirkin wrote:
> > > There could be some misunderstanding here. I thought it's somehow similar: a
> > > CONFIG_VHOST_MENU=y will be left in the defconfigs even if CONFIG_VHOST is
> > > not set.
> > > 
> > > Thanks
> > > 
> > BTW do entries with no prompt actually appear in defconfig?
> > 
> 
> Yes. I can see CONFIG_VHOST_DPN=y after make ARCH=m68k defconfig

You see it in .config right? So that's harmless right?

-- 
MST

