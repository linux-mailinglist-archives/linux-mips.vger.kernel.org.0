Return-Path: <linux-mips+bounces-15553-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yiPNOb/jS2qqcAEAu9opvQ
	(envelope-from <linux-mips+bounces-15553-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:19:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF1713C9F
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:19:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=ImgA1Hj8;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15553-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15553-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A540A34C54E8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4907D3A8FE9;
	Mon,  6 Jul 2026 15:03:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9E381EA3;
	Mon,  6 Jul 2026 15:03:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350196; cv=pass; b=b+81d4HB/pVY4aUY2280ncZjGcKjCV9drPv1/L7XMxdmP6moNGqJQgLys24QdZoQmn0ESUClaC+T88/Rwbt4SB72jSaR8V8gu8FjY+PD1sn4xKRsNsCtKrZIccnMP9Y4SrWZ8hGzVc2zNeugMle1EdTii0hKWmlYS3iqi98tieA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350196; c=relaxed/simple;
	bh=Lu9wLxVbs/Lk9+t6I1rSrNmYpbDMa4qMMSV45NFfKlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3Co5jkJ62iOIFjdgX5tkRQzXxpjr1fFYvg6phzny1oFZI1PtGHVUMgPI06r5gZDAw3ttjhs36NacXfL9q4ciAOea509wnnZDmaVpeTqAgZ7O8hAhq6ZRT85UggHSIOFD9jJ+CWqXvenUNDWTC4di+9uoeXuWr1h0JsMHnMVI4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=ImgA1Hj8; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1783350034; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ShBwgIB9Tp0j2ieVFNXD2nNlBvkYSrZX6KL3AeDB+tfLOnE+7CHZu5rN/HP3/wiA65AfS2awNfBnLG6v3KttLERp5k37uX5cTjLkGlHu1epQC0tpKbiWTjw2bmWO4R3cJ9Bceq/UN4MGpiO+12hQk2boeKqRMVN9X9phSckbKF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783350034; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3XwyWTIrA/V6J7edt1EVqOvQjuCfvvAm71aap9OvOCI=; 
	b=aUIQNdoKYFXhqBqNhsY+F02CkGve6EXcuTScFbe5OHL/WHUKXk+LgtUumBUdfOodPJNOea5bCjHJ9ycCR0cPvohjbCewZV5P129fWS7uy+uA2tTiwdLdX3wI3zpXyvb7h2kq1Re2lQrUV6CFisZwObNuwW+4qzyVdb787O027/g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783350034;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3XwyWTIrA/V6J7edt1EVqOvQjuCfvvAm71aap9OvOCI=;
	b=ImgA1Hj80B9JHQg2Jp0iR3Hfkzuv+c1ZmjHHLY5vXEEHJlu3rx/mY5cc4HVAWJDf
	QREjGnw/uNA5JcHG0nEUz0PUvTE/0uKgXtwmj8p0wIRVC2fcF+pZOIvPjdNL8NnCNrh
	RgJCMxLw7XsRX8tO1eirdxvjf97IRGDZQzh4oCj8=
Received: by mx.zohomail.com with SMTPS id 1783350031182921.1240379629376;
	Mon, 6 Jul 2026 08:00:31 -0700 (PDT)
Message-ID: <3541fb84-81ce-4415-8027-38aa611834ae@collabora.com>
Date: Mon, 6 Jul 2026 18:00:09 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/42] media: synopsys: hdmirx: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Alexey Brodkin
 <abrodkin@synopsys.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eddie James <eajames@linux.ibm.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, linux-tegra@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260703193855.110619-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15553-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srini
 @kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org
 ,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[92];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FAF1713C9F

On 7/3/26 22:38, Mukesh Ojha wrote:
> Replace the hand-rolled devm_hdmirx_of_reserved_mem_device_release()
> devres action with devm_of_reserved_mem_device_init(), which handles the
> cleanup automatically. This removes both the wrapper function and the
> devm_add_action_or_reset() call.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d94..7c6acc6d7e88 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops = {
>  	.read = hdmirx_readl,
>  };
>  
> -static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
> -{
> -	of_reserved_mem_device_release(dev);
> -}
> -
>  static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
>  {
>  	struct device *dev = hdmirx_dev->dev;
> @@ -2316,16 +2311,9 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
>  	if (!device_property_read_bool(dev, "hpd-is-active-low"))
>  		hdmirx_dev->hpd_trigger_level_high = true;
>  
> -	ret = of_reserved_mem_device_init(dev);
> -	if (ret) {
> +	ret = devm_of_reserved_mem_device_init(dev);
> +	if (ret)
>  		dev_warn(dev, "no reserved memory for HDMIRX, use default CMA\n");
> -	} else {
> -		ret = devm_add_action_or_reset(dev,
> -					       devm_hdmirx_of_reserved_mem_device_release,
> -					       dev);
> -		if (ret)
> -			return ret;
> -	}
>  
>  	return 0;
>  }

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

