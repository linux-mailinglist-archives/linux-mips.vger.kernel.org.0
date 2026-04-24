Return-Path: <linux-mips+bounces-14309-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACcUBuRT62nkKwAAu9opvQ
	(envelope-from <linux-mips+bounces-14309-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 13:28:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21045DB31
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 13:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 667E8302591E
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 11:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C213AEF28;
	Fri, 24 Apr 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RieTxTY+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D92391840;
	Fri, 24 Apr 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029929; cv=none; b=u4kzaShktzm03BxZnWlPxBjzlAhuTX3wudutd5+jqohLP8mj3kkBxkvZ6PeuFtXTXBaMdwo8ykLp6bUg4RN3EIA1Wm8Hym5qsti2tZ7PZ6JINTYJLv93xdpLOpb6lipVQh2XOd/NzmUh5fK55hUCSdt1XFiaAr0Y5KWujcsl3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029929; c=relaxed/simple;
	bh=k2dQSsUN3UsAJ1unGnAR4k55qpqNs0OBMSNvjxtQslQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHmfgNTBl1a7/zR7rZS86xs6Obhpjq7LISmWeBLdk1vCIWPPW3/sDqy8Z4aPONj/+RIJAbkMdnFQReQm6TNsvDl//9u3zEQ85EwmxhD7zSoZ3fB3GwIs0/xl2yKs65zJ15+Eknh1kcU5vq+1g4yg0x5BySd/wznOjVmk4eBHqis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RieTxTY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE9AC19425;
	Fri, 24 Apr 2026 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777029929;
	bh=k2dQSsUN3UsAJ1unGnAR4k55qpqNs0OBMSNvjxtQslQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RieTxTY+OD0EHdNFiednn77ShTUW23fykA/Y/bTaXoQrA9pwGKwc5da4GAD7kaZUn
	 CDmONrjaaWYzuHighXVinGgBsy0kGhp8yORunivuRc3gs+0LrG8nnU2iiP48tiIcAZ
	 Lqw5HEiVGh4aMFys9I3VUASZLzQmvHwdH97wDa5et/dQUw6/ICJcn6jS7I9rwAqeAN
	 +hTpJzJlVTZqi/9GZwzT2l9YumVf/XmyLuRsIrlbIB+9QcNNZpYhBmOSz0pRooL7ow
	 rVlawbmYTMW/m13he4E7UNODSi2xC25K+QunJtX+1qXGzIOQRSszzRG1oab/g0hDZZ
	 WAj8ROG+YiFlQ==
Date: Fri, 24 Apr 2026 12:25:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>, andy@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, paul@crapouillou.net,
 linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 0/2] use guard()() to handle synchronisation
Message-ID: <20260424122521.7d33d944@jic23-huawei>
In-Reply-To: <aesmhCADsVmJoSgQ@ashevche-desk.local>
References: <20260423012011.41001-1-felipers@ime.usp.br>
	<aesmhCADsVmJoSgQ@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7D21045DB31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14309-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On Fri, 24 Apr 2026 11:15:00 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Apr 22, 2026 at 10:18:29PM -0300, Felipe Ribeiro de Souza wrote:
> > Refactor ingenic_adc_read_chan_info_raw() and replace mutex_lock()
> > and mutex_unlock() calls with guard()() in drivers/iio/adc/ingenic-adc.c  
Note for future, the cover letter title needs to be more specific.


[PATCH v4 0/2] iio: adc: ingenic: use guard()() to handle synchronization

That is what it turns up as in tools like patchwork and sashiko rather than
the names of individual patches so I'd like it to be clear in what it affects.

Speaking of which Sashiko raises a valid concern with the naming.
_locked() normally means a lock is already held rather than it
won't be taken.  However, locked naming is in line with existing _unlocked()
naming in this driver. 

Now I'm not sure what best solution to this is. We don't have particularly
firm naming conventions in IIO but we probably should have.

We could move to the reasonably common variant of __xxx() means the
variant of xxx() that should be called with a lock held.  With the addition of
__must_hold() markings that should be clear.

I've been meaning to mess around with the new context analysis stuff so I had
a play.  Note that enabling it for all ADCs gives a mess so I'll need
to dig into that.  My understanding is that this stuff is prone to false
positives, but maybe some are correct or reflect missing markings.

The makefile change is not something I'd upstream yet
but if you have clang 22 or later and enable CONFIG_WARN_CONTEXT_ANALYSIS
this will turn it on for this one driver.

If you want to confirm it is working flip the __must_hold to __must_not_hold()
and you'll get something like:

drivers/iio/adc/ingenic-adc.c:202:2: warning: cannot call function '__ingenic_adc_enable' while mutex 'adc->lock' is held [-Wthread-safety-analysis]
  202 |         __ingenic_adc_enable(adc, engine, enabled);
      |         ^

which is cool as the form combines effectively documenting the locking rules
and checking them at compile time.

If other reviewers are fine with the naming convention, then a precursor
patch to change the existing _unlocked() naming + add the __must_hold()
marking then the new naming folded into patch 1 of this series.


diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 097357d146ba..a06807609bde 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -3,6 +3,7 @@
 # Makefile for IIO ADC drivers
 #
 
+CONTEXT_ANALYSIS_ingenic-adc.o=y
 obj-$(CONFIG_IIO_ADC_HELPER) += industrialio-adc.o
 
 # When adding new entries keep the list in alphabetical order
diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 5622b62840e6..a4d5d139af5f 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -179,9 +179,8 @@ static void ingenic_adc_set_config(struct ingenic_adc *adc,
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
 }
 
-static void ingenic_adc_enable_unlocked(struct ingenic_adc *adc,
-					int engine,
-					bool enabled)
+static void __ingenic_adc_enable(struct ingenic_adc *adc, int engine,
+				 bool enabled) __must_hold(&adc->lock)
 {
 	u8 val;
 
@@ -200,7 +199,7 @@ static void ingenic_adc_enable(struct ingenic_adc *adc,
 			       bool enabled)
 {
 	guard(mutex)(&adc->lock);
-	ingenic_adc_enable_unlocked(adc, engine, enabled);
+	__ingenic_adc_enable(adc, engine, enabled);
 }
 
 static int ingenic_adc_capture(struct ingenic_adc *adc,
@@ -219,11 +218,11 @@ static int ingenic_adc_capture(struct ingenic_adc *adc,
 	cfg = readl(adc->base + JZ_ADC_REG_CFG);
 	writel(cfg & ~JZ_ADC_REG_CFG_CMD_SEL, adc->base + JZ_ADC_REG_CFG);
 
-	ingenic_adc_enable_unlocked(adc, engine, true);
+	__ingenic_adc_enable(adc, engine, true);
 	ret = readb_poll_timeout(adc->base + JZ_ADC_REG_ENABLE, val,
 				 !(val & BIT(engine)), 250, 1000);
 	if (ret)
-		ingenic_adc_enable_unlocked(adc, engine, false);
+		__ingenic_adc_enable(adc, engine, false);
 
 	writel(cfg, adc->base + JZ_ADC_REG_CFG);
 
@@ -624,9 +623,8 @@ static int ingenic_adc_read_avail(struct iio_dev *iio_dev,
 	}
 }
 
-static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,
-					struct iio_chan_spec const *chan,
-					int *val)
+static int ingenic_adc_read_chan(struct ingenic_adc *adc,
+				 struct iio_chan_spec const *chan, int *val)
 {
 	int cmd, ret, engine = (chan->channel == INGENIC_ADC_BATTERY);
 
@@ -680,7 +678,7 @@ static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
 		return ret;
 	}
 
-	ret = ingenic_adc_read_chan_locked(adc, chan, val);
+	ret = ingenic_adc_read_chan(adc, chan, val);
 
 	clk_disable(adc->clk);
 



> 
> Now LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> One side note in case you want to address it keep my tag for the existing
> changes.
Separate change anyway so I'm fine with that as a follow up.


> 


