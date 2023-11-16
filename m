Return-Path: <linux-mips+bounces-83-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C37EE4F4
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 17:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953EE1C20866
	for <lists+linux-mips@lfdr.de>; Thu, 16 Nov 2023 16:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C933A8EB;
	Thu, 16 Nov 2023 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8CC1AD;
	Thu, 16 Nov 2023 08:09:38 -0800 (PST)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-581fb6f53fcso535528eaf.2;
        Thu, 16 Nov 2023 08:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700150978; x=1700755778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOcig5yxgC/BK7paxQilGIUUqt33158KEtjyWWD9YNQ=;
        b=SbMYWa7EOaB+G14I4UG3U/4T4YdhbcjMMsFLilC57W1ftQEvK4/LXgviXdl8PMuBPS
         /kTpac5+dHIi6DrBqiiYCRu+hRApntFDkI13xrUmPLIME0gToHlFX2zSnkoOyH/ZXIhY
         9uAA67b7ET+enjmcizY0MwCJb9VHzR+jvi/oIgIsmAdUMJ8kb9Udc9n0Bj9nfLIXCZf1
         +Dmv4N92bSTRzPSjx6vrmBVi1JndUflsWhixEUnx2C3yZU7gCsFTO8pZqK+xZo5yUdB8
         U9H5BrmEqt+Zz9wGg6erzQZ7nejfEScAu/ZBRF93o1Xyp4Rt9WhVpNw67U6Z0VY+S89x
         qOQg==
X-Gm-Message-State: AOJu0YzyaJWBnjXGrvyPAs+9cW8fckOGzix49+NiwOxyLX1LkcndlKXu
	iLXM7VjeK4rfhi0tNF1dAw==
X-Google-Smtp-Source: AGHT+IF+0KlzPHTSAYd8f0qoIp2VoeCx7YS9oDEEvzGxQfpBkJopgD5yuI9JsZg7rhEeaLCizK3xpA==
X-Received: by 2002:a4a:9248:0:b0:57d:e76d:c206 with SMTP id g8-20020a4a9248000000b0057de76dc206mr16692489ooh.1.1700150978164;
        Thu, 16 Nov 2023 08:09:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d8-20020a4aaa88000000b0058a133c3641sm611522oon.6.2023.11.16.08.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:09:37 -0800 (PST)
Received: (nullmailer pid 2416819 invoked by uid 1000);
	Thu, 16 Nov 2023 16:09:36 -0000
Date: Thu, 16 Nov 2023 10:09:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Cc: Will Deacon <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton <akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson <sean.anderson@seco.com>, x86@kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>, xe-linux-external@cisco.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] of: replace command line handling
Message-ID: <20231116160936.GA2376455-robh@kernel.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-8-danielwa@cisco.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110013817.2378507-8-danielwa@cisco.com>

On Thu, Nov 09, 2023 at 05:38:11PM -0800, Daniel Walker wrote:
> Rob Herring has complained about this section of code. I removed the
> command line handling code to the cmdline.h header. This hopefully makes
> it easier for Rob to maintain it (at least he doesn't have to look at it
> directly anymore).

Well, my goal is to eliminate drivers/of/, but no.

> I would like to add a Kconfig option called
> OF_DEPRECATED_CMDLINE which an architecture would set if it uses this code.

Which architecture needs this code? Do we wait and see who complains 
their platform broke and then go set this option? In the meantime, new 
platforms started depending on the new behavior and setting the option 
may break them. So we can't have a kconfig option.

> This would allow a platform to use the cmdline.h and the added function
> directly and remove the Kconfig option. This change would be in a subsequent
> patch.

Per platform code handling the cmdline is completely the wrong 
direction. Per arch behavior is bad enough.

Rob

